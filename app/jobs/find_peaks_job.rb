require 'overpass_api_ruby'


class FindPeaksJob < ActiveJob::Base
  queue_as :default

  #def perform(*args)
  def perform(user_id)

    user = User.find(user_id)
    # todo - do something if we can't find user
      # redirect to connect if token is null
    activities = StravaHelper.all_activities(user.token) 
    
    activities.each do |activity|

      # check if all activities are already indexed
      break if IndexedActivity.where(user_id: user_id).count == activities.count
      # check if activity is already indexed 
      next if IndexedActivity.where(activity_id: activity['id']).exists?

      # mark activity as indexed
      indexed_activity = user.indexed_activities.create(activity_id: activity['id'])
      indexed_activity.save

      polyline = activity['map']['summary_polyline']
      next if polyline == nil
      #decoded_polyline = StravaHelper.decode_polyline(polyline)
      client = Strava::Api::V3::Client.new(:access_token => user.token)
      stream = client.retrieve_activity_streams(activity['id'], 'latlng', {"resolution"=>"medium"})
      decoded_polyline = stream[0]["data"]

      bounding_box = StravaHelper.get_buffered_bounding_box(decoded_polyline)
      peaks_in_bbox = StravaHelper.find_peaks(bounding_box)

      peaks_in_bbox.each do |peak|
        peak_loc = [peak[:lat].to_f, peak[:lon].to_f]
        #for each point along line, check if distance to each peak is within radius
        decoded_polyline.each do |point|
          point_loc = [point[0].to_f, point[1].to_f]
          distance_to_peak = StravaHelper.distance_haversine(peak_loc, point_loc)
          if distance_to_peak < 60

            summit_completion = SummitCompletion.new
            summit_completion.summit = peak[:tags]['name']
            summit_completion.user_id = user[:id]
            summit_completion.activity_id = activity['id']
            summit_completion.osm_summit_id = peak[:id]
            summit_completion.osm_summit_elevation = peak[:tags]['ele']
            summit_completion.osm_summit_lat = peak[:lat]
            summit_completion.osm_summit_lon = peak[:lon]
            summit_completion.date = activity['start_date_local']
            summit_completion.save

            puts user[:name] + " summited " + peak[:tags]['name']
            break
          end

        end

      end
    end

    #@client.retrieve_activity_streams(:some_id)

    
    # for this user Id, 
    # we want to get all of their activities on strava
    # for each activity, check if it has been indexed yed
    # if it hasn't been indexed, index it
    # to index an activity, we'll mark it as indexed,
      # then get it's summary polyline, decode it, get its bounding box, then get all peaks that 
      #fall in it's bounding box. 
      # for each peak that falls within its bounding box, we'll compare it's location to the decoded 
      # polyline. if it's close enough, we'll add that peak to summit completions. 

 
    
  end
end

require 'overpass_api_ruby'


class FindPeaksJob < ActiveJob::Base
  queue_as :default

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

      client = Strava::Api::V3::Client.new(:access_token => user.token)
      streams = client.retrieve_activity_streams(activity['id'], 'time,altitude,latlng', {:resolution=>"high"})

      time_stream = streams.detect{ |e| e['type'] == 'time' };
      ele_stream = streams.detect{ |e| e['type'] == 'altitude' };
      latlng_stream = streams.detect{ |e| e['type'] == 'latlng' };

      time_stream_data = time_stream['data']
      ele_stream_data = ele_stream['data']
      latlng_stream_data = latlng_stream['data']

      check_for_summits(user, activity, latlng_stream_data)

      # 500 ft
      check_for_records(user, activity, ele_stream_data, time_stream_data, 152.4)

      # 1000 ft
      check_for_records(user, activity, ele_stream_data, time_stream_data, 304.8)

      # Vertical Km 
      check_for_records(user, activity, ele_stream_data, time_stream_data, 1000)
    end
  end

  def check_for_summits(user, activity, latlng_stream)

    bounding_box = StravaHelper.get_buffered_bounding_box(latlng_stream)
    peaks_in_bbox = StravaHelper.find_peaks(bounding_box)

    # puts "Peaks in bbox: \n\n"
    # puts peaks_in_bbox

    peaks_in_bbox.each do |peak|
      peak_loc = [peak[:lat].to_f, peak[:lon].to_f]
      #for each point along line, check if distance to each peak is within radius
      # puts peak
      latlng_stream.each do |point|
        # puts point
        point_loc = [point[0].to_f, point[1].to_f]
        distance_to_peak = StravaHelper.distance_haversine(peak_loc, point_loc)
        # puts "Distance to peak: " + distance_to_peak.to_s
        if distance_to_peak < 60

          summit_completion = SummitCompletion.new
          summit_completion.summit = peak[:tags]['name']
          summit_completion.user_id = user[:id]
          summit_completion.activity_id = activity['id']
          summit_completion.activity_name = activity['name']
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

  def check_for_records(user, activity, ele_stream, time_stream, target_gain) 

    return if activity['type'] == "AlpineSki"
    return if ele_stream.max - ele_stream.min < target_gain

    large_number = 9999999

    activity_record = large_number
    record_start_index = nil
    record_end_index = nil

    for i in 0..ele_stream.length - 1
      for j in i..ele_stream.length - 1
        ele_diff = ele_stream[j] - ele_stream[i]
        time_diff = time_stream[j] - time_stream[i]
        if(time_diff > activity_record)
          break
        end
        if(ele_diff > target_gain && time_diff < activity_record)
          activity_record = time_diff
          record_start_index = i
          record_end_index = j
          break
        end
      end
      if activity_record == large_number
        break
      end
    end

    if activity_record != large_number
      climb_record = ClimbRecord.new
      climb_record.elevation_gain = target_gain
      climb_record.user_id = user[:id]
      climb_record.activity_id = activity['id']
      climb_record.activity_name = activity['name']
      climb_record.start_time = time_stream[record_start_index]
      climb_record.end_time = time_stream[record_end_index]
      climb_record.total_time = time_stream[record_end_index] - time_stream[record_start_index]
      climb_record.save
      puts user[:name] + ": new climb record " + (climb_record.total_time / 60).to_s
    end
  end
end

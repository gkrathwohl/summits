module StravaHelper 

  require 'overpass_api_ruby'

  def StravaHelper.activity_count(token, athlete_id)
    client = Strava::Api::V3::Client.new(:access_token => token)
    stats = client.totals_and_stats(athlete_id)
    count = stats["all_run_totals"]["count"] + stats["all_ride_totals"]["count"]
    return stats
  end
  
  def StravaHelper.all_activities(token)
    client = Strava::Api::V3::Client.new(:access_token => token)
    activities = []
    page_number = 1
    page_results = client.list_athlete_activities({'per_page' => 200, 'page' => page_number})
    activities.concat page_results
    while page_results.count > 0
      page_number += 1
      page_results = client.list_athlete_activities({'per_page' => 200, 'page' => page_number})
      activities.concat page_results
    end
    return activities
  end

  def StravaHelper.get_activity(token, id)
    client = Strava::Api::V3::Client.new(:access_token => token)
    return client.retrieve_an_activity(id)
  end

  def StravaHelper.decode_polyline(polylineString)
    return Polylines::Decoder.decode_polyline(polylineString)
  end

  def StravaHelper.get_buffered_bounding_box(decoded_polyline)
    minLat, minLon = Float::MAX, Float::MAX
    maxLat, maxLon = -1 * Float::MAX, -1 * Float::MAX
    decoded_polyline.each do |point|
      if point[0] < minLat
        minLat = point[0]
      end
      if point[1] < minLon
        minLon = point[1]
      end
      if point[0] > maxLat
        maxLat = point[0]
      end
      if point[1] > maxLon
        maxLon = point[1]
      end
    end

    bounding_box = {}
    bounding_box['minLat'] = minLat - 0.01
    bounding_box['minLon'] = minLon - 0.01
    bounding_box['maxLat'] = maxLat + 0.01
    bounding_box['maxLon'] = maxLon + 0.01

    return bounding_box
  end
  
  def StravaHelper.find_peaks(bbox)

    ba_query = '<osm-script><query into="_" type="node"><bbox-query e="' + bbox['maxLon'].to_s + '" into="_" n="' +  bbox['maxLat'].to_s + '" s="' + bbox['minLat'].to_s + '" w="' + bbox['minLon'].to_s + '"/><has-kv k="natural" modv="" v="peak"/></query><print e="" from="_" geometry="skeleton" limit="" mode="body" n="" order="id" s="" w=""/></osm-script>'

    overpass = OverpassAPI.new()

    result_hash = overpass.raw_query(ba_query)

  end


  def StravaHelper.distance_haversine loc1, loc2
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    return rm * c # Delta in meters
  end

end
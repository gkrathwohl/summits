require 'strava/api/v3/common'

module Strava::Api::V3
  module Activity
    include Common

    # Fetch information about a specific activity
    #
    # See {http://strava.github.io/api/v3/activities/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return activity json (see http://strava.github.io/api/v3/activities/)
    def retrieve_an_activity(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("activities/#{id}", args, 'get', options, &block)
    end

    # Fetch information about the current athlete's activities
    #
    # See {http://strava.github.io/api/v3/activities/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return activities json (see http://strava.github.io/api/v3/activities/)
    def list_athlete_activities(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call('athlete/activities', args, 'get', options, &block)
    end

    # Fetch information about the current athlete's friends' activities
    #
    # See {http://strava.github.io/api/v3/activities/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return activities json (see http://strava.github.io/api/v3/activities/)
    def list_friends_activities(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call('activities/following', args, 'get', options, &block)
    end

    # Fetch information about the activity's zones
    #
    # See {http://strava.github.io/api/v3/activities/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return activities json (see http://strava.github.io/api/v3/activities/)
    def list_activity_zones(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("activities/#{id}/zones", args, 'get', options, &block)
    end

    # Fetch information about the activity's laps
    #
    # See {http://strava.github.io/api/v3/activities/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return activities json (see http://strava.github.io/api/v3/activities/)
    def list_activity_laps(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("activities/#{id}/laps", args, 'get', options, &block)
    end

    # Updates an activity
    # See {http://strava.github.io/api/v3/activities/#put-updates} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return updated activities json (see http://strava.github.io/api/v3/activities/)
    def update_an_activity(id, args = {}, options = {}, &block)
      api_call("activities/#{id}", args, 'put', options, &block)
    end
  end
end

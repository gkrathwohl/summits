require 'strava/api/v3/common'

module Strava::Api::V3
  module Stream
    include Common

    # Fetch information about a stream for a specific activity
    #
    # See {http://strava.github.io/api/v3/streams} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return stream json (see http://strava.github.io/api/v3/streams)
    def retrieve_activity_streams(id, types, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("activities/#{id}/streams/#{types}", args, 'get', options, &block)
    end

    # Fetch information about a subset of the activity streams that correspond to that effort
    #
    # See {http://strava.github.io/api/v3/streams} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return stream json (see http://strava.github.io/api/v3/streams)
    def retrieve_effort_streams(id, types, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("segment_efforts/#{id}/streams/#{types}", args, 'get', options, &block)
    end

    # Fetch information about a stream for a specific route
    #
    # See {http://strava.github.io/api/v3/streams} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return stream json (see http://strava.github.io/api/v3/streams)
    def retrieve_route_streams(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("routes/#{id}/streams/", args, 'get', options, &block)
    end
    
    # Fetch information about a stream for a specific segment
    #
    # See {http://strava.github.io/api/v3/streams} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return stream json (see http://strava.github.io/api/v3/streams)
    def retrieve_segment_streams(id, types, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("segments/#{id}/streams/#{types}", args, 'get', options, &block)
    end

  end
end

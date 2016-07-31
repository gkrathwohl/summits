require 'strava/api/v3/common'

module Strava::Api::V3
  module Route
    include Common

    # Fetch information about a specific route
    #
    # See {http://strava.github.io/api/v3/routes/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return routes json (see http://strava.github.io/api/v3/routes/)
    def retrieve_a_route(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("routes/#{id}", args, 'get', options, &block)
    end

    # Fetch information about the current athlete's routes
    #
    # See {http://strava.github.io/api/v3/routes/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return routes json (see http://strava.github.io/api/v3/routes/)
    def list_athlete_routes(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call('athlete/routes', args, 'get', options, &block)
    end
  end
end

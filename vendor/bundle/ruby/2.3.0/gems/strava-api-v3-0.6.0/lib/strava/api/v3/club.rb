require 'strava/api/v3/common'

module Strava::Api::V3
  module Club
    include Common

    # Fetch information about a specific item of club
    #
    # See {http://strava.github.io/api/v3/clubs/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return club json (see http://strava.github.io/api/v3/clubs/)
    def retrieve_a_club(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("clubs/#{id}", args, 'get', options, &block)
    end

    # Fetch information about the clubs for the current user
    #
    # See {http://strava.github.io/api/v3/clubs/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return club json (see http://strava.github.io/api/v3/clubs/)
    def list_athlete_clubs(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call('athlete/clubs', args, 'get', options, &block)
    end

    # Fetch information about the members of a specific club
    #
    # See {http://strava.github.io/api/v3/clubs/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return club json (see http://strava.github.io/api/v3/clubs/)
    def list_club_members(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("clubs/#{id}/members", args, 'get', options, &block)
    end

    # Fetch information about the activities of a specific club
    #
    # See {http://strava.github.io/api/v3/clubs/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return club json (see http://strava.github.io/api/v3/clubs/)
    def list_club_activities(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("clubs/#{id}/activities", args, 'get', options, &block)
    end
  end
end

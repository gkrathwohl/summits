require 'strava/api/v3/common'

module Strava::Api::V3
  module SegmentEffort
    include Common

    # Fetch information about a specific segment effort
    #
    # See {http://strava.github.io/api/v3/efforts/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return segment effort json (see http://strava.github.io/api/v3/efforts/)
    def retrieve_a_segment_effort(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("segment_efforts/#{id}", args, 'get', options, &block)
    end
  end
end

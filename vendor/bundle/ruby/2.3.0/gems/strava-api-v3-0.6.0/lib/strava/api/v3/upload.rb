require 'strava/api/v3/common'

module Strava::Api::V3
  module Upload
    include Common

    # Uploads an activity
    #
    # See {https://strava.github.io/api/v3/uploads/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return upload status json (see https://strava.github.io/api/v3/uploads/)
    def upload_an_activity(args = {}, options = {}, &block)
      api_call("uploads", args, 'post', options, &block)
    end

    # Fetch information about an upload
    #
    # See {https://strava.github.io/api/v3/uploads/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return upload status json (see https://strava.github.io/api/v3/uploads/)
    def retrieve_upload_status(id, args = {}, options = {}, &block)
      api_call("uploads/#{id}", args, 'get', options, &block)
    end

  end
end

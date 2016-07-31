require 'helper'
 
describe Strava::Api::V3 do
  it 'should have a version' do
    Strava::Api::V3::VERSION.wont_be_nil
  end
end
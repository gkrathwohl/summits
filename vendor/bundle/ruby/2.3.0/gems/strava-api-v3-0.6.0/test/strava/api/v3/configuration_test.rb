require 'helper'

module Strava::Api::V3 
  describe 'configuration' do
 
    describe '.access_token' do
      it 'should return access token' do
        puts Strava::Api::V3.access_token
        puts Strava::Api::V3::Configuration::DEFAULT_ACCESS_TOKEN
        Strava::Api::V3.access_token.must_equal Strava::Api::V3::Configuration::DEFAULT_ACCESS_TOKEN
      end
    end
  
    after do
      Strava::Api::V3.reset
    end

    describe '.configure' do
      Strava::Api::V3::Configuration::VALID_CONFIG_KEYS.each do |key|
        it "should set the #{key}" do
          Strava::Api::V3.configure do |config|
            config.send("#{key}=", key)
            Strava::Api::V3.send(key).must_equal key
          end
        end
      end
    end  
  end 
end
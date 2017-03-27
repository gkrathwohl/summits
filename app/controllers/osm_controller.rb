#controller for OSM api calls

class OsmDb < ActiveRecord::Base
end

class OsmController < ApplicationController

    def get_summits

        @connection = OsmDb.establish_connection(
            :adapter => "postgresql",
            :host => "40.123.50.157",
            :port => 32768,
            :database => "osm",
            :username => "osm",
            :password => "osm"
        )

        @bbox = params[:bbox]

        if(@bbox)
            @bbox_split = @bbox.split(",")
        end

        sql = "SELECT id, name, elevation_m, ST_Y(ST_Transform(geometry, 4326)), ST_X(ST_Transform(geometry, 4326)) FROM osm_mountain_peak_point WHERE geometry && ST_Transform(ST_MakeEnvelope(" + @bbox_split[0] + "," + @bbox_split[1] + "," + @bbox_split[2] + "," + @bbox_split[3] + ", 4326), 3857) ORDER BY elevation_m DESC NULLS LAST LIMIT 30;"
        @result = @connection.connection.execute(sql);
        #@connection.close 

        # ba_query = '<osm-script><query into="_" type="node"><bbox-query e="' + bbox_split[2].to_s + '" into="_" n="' +  bbox_split[3].to_s + '" s="' + bbox_split[1].to_s + '" w="' + bbox_split[0].to_s + '"/><has-kv k="natural" modv="" v="peak"/></query><print e="" from="_" geometry="skeleton" limit="" mode="body" n="" order="id" s="" w=""/></osm-script>'

        # overpass = OverpassAPI.new() 
        # result_hash = overpass.raw_query(ba_query)

        render json: @result
    end
end
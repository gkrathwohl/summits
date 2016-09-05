class SummitsController < ApplicationController

    def index

    end

    def show
        if(params[:id])
            @id = params[:id]

            @summit_completions = SummitCompletion.where osm_summit_id: @id

        end
    end

end



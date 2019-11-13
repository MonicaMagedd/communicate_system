module Api
        class SearchController < ApplicationController
        def search
            @messages = params[:q].nil? ? [] : Message.search(params[:q])
        end
    end
end

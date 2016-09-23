class SearchesController < ApplicationController
	def home 
		@search = Search.new
	end

	def search
		@search = Search.new(search_params)
		@list = Search.scrape_home_depot(@search.query)
		@list += Search.scrape_lowes(@search.query)
	end

	def search_params
		params.require(:search).permit(:query)
	end
end

class SitesController < ApplicationController
	def home 
		@search = Search.new
	end

	def search
		@search = Search.new(search_params)
		puts "AAAAAAAAAAAAAAAA"
		puts search_params
		puts search_params[:query]
		@list = Search.scrape_home_depot(@search.query)
		@list += Search.scrape_lowes(@search.query)
		@projects = current_user.projects
	end

	def search_params
		params.require(:search).permit(:query)
	end

	def sort_by
		@search = Search.new({:query => params[:search_term]})
		
		@list = Search.scrape_home_depot(params[:search_term])
		@list += Search.scrape_lowes(params[:search_term])
		@projects = current_user.projects
		@term = params[:sort_term]
		@sorted_list = @list.sort { |a, b| a[@term] <=> b[@term]}
		puts "AAAAAAAAAAAAAAAA"
		@sorted_list.each do |x| 
			puts x[:price]
		end
		puts "AAAAAAAAAAAAAAAA"
		render :sort_by
	end
end

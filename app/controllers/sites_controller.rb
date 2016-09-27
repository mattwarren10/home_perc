class SitesController < ApplicationController
	def home 
		@search = Search.new
	end

	def search
		@search = Search.new(search_params)
		puts "XXXXXXXXXXXXXXXXX"
		puts search_params
		puts search_params[:query]
		puts "YYYYYYYYYYYYYYYYY"
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
		term = params[:sort_term].to_sym
		@sorted_list = @list.sort do |a, b| 
			if a[term] == nil 
				1 
			elsif b[term] == nil
				-1
			else
				a[term] <=> b[term]
			end
		end
		render :sort_by
	end
end

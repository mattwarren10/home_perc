class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def add_item
		project = Project.find_by(id: params[:id])
		product = Product.new
		project.products.push( product )
		project.total_price += product.price
		project.save
		redirct "/users/projects"
	end
end

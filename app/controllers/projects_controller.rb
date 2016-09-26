class ProjectsController < ApplicationController
	def index
		@projects = current_user.projects
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def add_item
		project = Project.find_by(id: params[:project_id])
		product = Product.new(
			photo: params[:product][:photo],
			description: params[:product][:description],
			price: (params[:product][:price].match(/\d+/)[0].to_f / 100),
			merchant: params[:product][:merchant]
		)
		project.products.push( product )
		project.total_price += product.price
		project.save
		flash[:success] = "Item added!"
	end
end

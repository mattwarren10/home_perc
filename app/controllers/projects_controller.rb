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

	def create
		
		project = Project.new(
			title: params[:project][:title]
		)
		project.user = current_user
		if project.save
			redirect_to users_projects_path, :notice => "Your project was saved!"
		else
			@project = project
			render "new"
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		project = Project.find(params[:id])
		project.user = current_user
		if project.update(project_params)
			redirect_to users_projects_path
		else
			redirect_to edit_users_project_path
		end

	end

	def add_item
		project = Project.find_by(id: params[:project_id])
		product = Product.new(
			photo: params[:product][:photo],
			description: params[:product][:description],
			price: (params[:product][:price].match(/\d+/)[0].to_i / 100),
			merchant: params[:product][:merchant]
		)
		project.products.push( product )
		project.total_price = 0
		project.total_price += product.price
		project.save
		flash[:success] = "Item added!"
	end

	def destroy
		project = Project.find(params[:id])
		project.destroy
		redirect_to users_projects_path
	end

	private
	def project_params
		params.require(:project).permit(:title)
	end
end

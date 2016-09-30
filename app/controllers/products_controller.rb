class ProductsController < ApplicationController
	def destroy
		product = Product.find(params[:product_id])
		project = Project.find(params[:id])
		product.destroy
		project.total_price -= product.price
		project.save
		redirect_to users_project_path(project.id)
	end
end

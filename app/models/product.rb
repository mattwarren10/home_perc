class Product < ApplicationRecord
	has_many :project_products
	has_many projects, through: :project_products
end

class Product < ApplicationRecord
	has_many :project_products
	has_many :projects, through: :project_products
	validates :price, numericality: {:greater_than => 0}
end

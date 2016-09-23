class Project < ApplicationRecord
	belongs_to :user
	has_many :project_products
	has_many :products, through: :project_products
end

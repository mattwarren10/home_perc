class ProjectProduct < ApplicationRecord
	belongs_to :project
	belongs_to :product
end

class VehicleBrand < ApplicationRecord
	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :categories, :allow_destroy => true

	has_many :vehicle_models
 	
	validates :name, presence: :true
end
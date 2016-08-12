class VehicleBrand < ApplicationRecord
	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :categories, :allow_destroy => true
 	
	validates :name, presence: :true
end
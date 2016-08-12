class Category < ApplicationRecord
	has_and_belongs_to_many :vehicle_brands
 	accepts_nested_attributes_for :vehicle_brands, :allow_destroy => true

 	has_many :vehicle_models

	validates :name, presence: :true
end

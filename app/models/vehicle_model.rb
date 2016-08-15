class VehicleModel < ApplicationRecord
	belongs_to :vehicle_brand
 	belongs_to :category
 	has_many :advertisements
 	
 	validates :name, presence: true
end
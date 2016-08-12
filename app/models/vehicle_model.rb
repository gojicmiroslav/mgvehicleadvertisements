class VehicleModel < ApplicationRecord
	belongs_to :vehicle_brand
 	belongs_to :category
 	validates :name, presence: true
end
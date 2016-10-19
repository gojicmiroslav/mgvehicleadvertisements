class AdvertisementType < ApplicationRecord
	has_many :advertisements
	
	validates :name, presence: :true
end
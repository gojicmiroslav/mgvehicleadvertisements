class AdvertisementType < ApplicationRecord
	validates :name, presence: :true
end
class AdvertisementInformation < ActiveRecord::Base
	belongs_to :information
	belongs_to :advertisement
	
	def self.get_advertisement_information advertisement, information
		return if advertisement.nil? or information.nil?

		advertisement_information = AdvertisementInformation.where("advertisement_id = ? AND information_id = ?", 
																	advertisement.id, information.id)

		return advertisement_information.first
	end

end
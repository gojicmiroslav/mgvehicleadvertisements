class Information < ActiveRecord::Base
	belongs_to :information_type
	has_and_belongs_to_many :categories
	#has_many :information_options
	has_many :advertisement_informations
	has_many :advertisements, through: :advertisement_informations
	has_and_belongs_to_many :items

	accepts_nested_attributes_for :categories 

	scope :basic_information, -> { where(information_type: InformationType.find_by(name: "Basic")) }  
	scope :additional_information, -> { where(information_type: InformationType.find_by(name: "Additional")) }  

	def is_basic
		return information_type.name.eql?("Basic")
	end

	def is_additional
		return information_type.name.eql?("Additional")
	end

	def find_advertisement_information_value(advertisement)
    	advertisement_information = AdvertisementInformation.get_advertisement_information(advertisement, self)

		if advertisement_information.nil?
			return nil
		end

		return advertisement_information.value
	end

	

	def self.get_all_information_items information_name
	    information = Information.find_by(name: information_name)

	    if !information.nil?
	    	return information.items
	    else
	    	return []
	    end
	end

	# OLD
	# def get_advertisement_information_item(advertisement) 
	# 	advertisement_information = AdvertisementInformation.get_advertisement_information(advertisement, self)

	# 	if advertisement_information.nil? 
	# 		return nil
	# 	end

	# 	ret_val = 0
	# 	items.ids.each do |id|
	# 		item = Item.find(id)
	# 		if item.name == advertisement_information.value
	# 			ret_val = id
	# 			break
	# 		end
	# 	end

	# 	return ret_val
	# end

	# REFACTORED
	def get_advertisement_information_item(advertisement)
		return if advertisement.nil?

		advertisement_information = AdvertisementInformation.get_advertisement_information(advertisement, self)
		get_advertisement_information_item_id(advertisement_information)	
	end

	def get_advertisement_information_item_id(advertisement_information) 
		return if advertisement_information.nil? 

		get_item_id(advertisement_information.value)
	end

	def get_item_id(value)
		return if value.nil? or value.eql?("")

		get_id_from_items(value)
	end

	def get_id_from_items(value)
		return if items.nil? 

		items.find_each do |item|
			return item.id if item.name.eql?(value)
		end

		return nil
	end
end

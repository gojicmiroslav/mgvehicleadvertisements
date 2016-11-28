class SearchSuggestion < ApplicationRecord

	def self.terms_for(prefix)
		suggestions = where("term like ?", "#{prefix}_%")
		suggestions.order("popularity desc").limit(10).pluck(:term)
	end

	def self.index_items
		Item.find_each do |item|
			index_term(item.name)
			item.name.split.each { |t| index_term(t) }
		end
	end

	def self.index_vehicle_brands
		VehicleBrand.find_each do |vb|
			index_term(vb.name)
			vb.name.split.each { |t| index_term(t) }
		end
	end

	def self.index_vehicle_models
		VehicleModel.find_each do |model|
			index_term(model.name)
			model.name.split.each { |t| index_term(t) }
		end
	end

	def self.index_term(term)
		where(term: term.downcase).find_or_create_by(term: term).tap do |suggestion|
			suggestion.increment! :popularity 
		end
	end
end
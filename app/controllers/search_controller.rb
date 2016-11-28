class SearchController < ApplicationController

	def search
		term = params[:q]
		#TODO: increase popularity of term
		SearchSuggestion.find_or_create_by(term: term.downcase).increment! :popularity

		@category = Category.find_by(name: "Cars")
    	@categories = Category.all
    	@vehicle_brands = VehicleBrand.all
    	@advertisements = Advertisement.search(term, params[:page])
	end

	def advanced_search
		@category = Category.friendly.find(params[:category])
		@categories = Category.all
		@vehicle_brands = VehicleBrand.all

		@advertisements = Advertisement.advanced_search params, params[:page]
		render "search/search"
	end
end
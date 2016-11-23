class SearchController < ApplicationController

	def search
		@category = Category.find_by(name: "Cars")
    	@categories = Category.all
    	@vehicle_brands = VehicleBrand.all
    	@advertisements = Advertisement.search params[:q], params[:page]
	end

	def advanced_search
		@category = Category.friendly.find(params[:category])
		@categories = Category.all
		@vehicle_brands = VehicleBrand.all

		@advertisements = Advertisement.advanced_search params, params[:page]
		render "search/search"
	end
end
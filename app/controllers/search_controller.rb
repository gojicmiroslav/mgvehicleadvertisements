class SearchController < ApplicationController

	def search
		@category = Category.find_by(name: "Cars")
    	@categories = Category.all
    	@vehicle_brands = VehicleBrand.all
    	@advertisements = Advertisement.search params[:q], params[:page]
    	@search = params[:q]
	end

end
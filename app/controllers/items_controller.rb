class ItemsController < ApplicationController

	def search_term
		render json: Item.search(params[:term])
	end

end
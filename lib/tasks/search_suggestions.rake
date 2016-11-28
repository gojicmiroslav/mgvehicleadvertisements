namespace :search_suggestions do
	desc "Generate search suggestions from items"
	task index: :environment do
		SearchSuggestion.index_items
		SearchSuggestion.index_vehicle_brands
		SearchSuggestion.index_vehicle_models
	end
end
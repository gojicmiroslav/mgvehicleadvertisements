require "rails_helper"

RSpec.feature "Show Advertisement", :feature do
	fixtures :advertisement_types
	fixtures :users
	fixtures :information_types
	fixtures :information
	fixtures :items
	fixtures :categories	
	fixtures :vehicle_brands
	fixtures :vehicle_models
	fixtures :options
	fixtures :advertisements
	fixtures :advertisement_information

	let(:car_advertisement) { advertisements(:first_advertisement) }
	let(:bicycle_advertisement) { advertisements(:second_advertisement) }

	context "logged in user" do
		let(:user){ users(:miroslav) }
		before do
			login_as(user, :scope => :user)
		end

		scenario "show car advertisement detail" do
			visit advertisement_path(car_advertisement)

			expect(page).to have_content car_advertisement.title
			expect(page).to have_content car_advertisement.price
			expect(page).to have_content car_advertisement.year
			expect(page).to have_content car_advertisement.category.name

			car_advertisement.advertisement_informations.each do |info|
				expect(page).to have_content info.value
			end
			
			car_advertisement.options.each do |option|
				expect(page).to have_content option.name
			end
		end

		scenario "show bicycle advertisement detail" do
			visit advertisement_path(bicycle_advertisement)

			expect(page).to have_content bicycle_advertisement.title
			expect(page).to have_content bicycle_advertisement.price
			expect(page).to have_content bicycle_advertisement.year
			expect(page).to have_content bicycle_advertisement.category.name

			bicycle_advertisement.advertisement_informations.each do |info|
				expect(page).to have_content info.value
			end
			
			bicycle_advertisement.options.each do |option|
				expect(page).to have_content option.name
			end
		end
	end
end
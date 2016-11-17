require "rails_helper"

RSpec.feature "Search", :feature do

	fixtures :advertisement_types
	fixtures :information_types
	fixtures :information
	fixtures :items
	fixtures :categories	
	fixtures :vehicle_brands
	fixtures :vehicle_models
	fixtures :options
	fixtures :advertisements
	fixtures :advertisement_information

	context 'simple search' do
		scenario "with no keywords" do
			visit root_path
			fill_in("q", with: "")
			click_on 'search_button'
			expect(page).to have_content(advertisements(:first_advertisement).title)
			expect(page).not_to have_content(advertisements(:car_inactive_advertisement).title)
			expect(page).to have_css('div.pagination')
		end

		scenario "with no results" do
			visit root_path
			fill_in("q", with: "BLABLABLA")
			click_on 'search_button'
			expect(page).not_to have_content(advertisements(:first_advertisement).title)
			expect(page).not_to have_css('div.pagination')
			expect(page).to have_content("No results")
		end

		context "with keywords" do
			describe "one keyword" do
				scenario "in title" do
					visit root_path
					fill_in("q", with: "Opel")
					click_on 'search_button'
					expect(page).to have_content(advertisements(:first_advertisement).title)
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
				end

				scenario "in information" do
					visit root_path
					fill_in("q", with: "Diesel")
					click_on 'search_button'
					expect(page).to have_content(advertisements(:first_advertisement).title)
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
				end	

				scenario "with matches in title and information" do
					visit root_path
					fill_in("q", with: "Commercial")
					click_on 'search_button'
					expect(page).to have_content(advertisements(:first_advertisement).title)
					expect(page.all("a[@id='advertisement_#{advertisements(:first_advertisement).id}']").count).to eq(1)
				end	
			end

			describe "multiple keywords" do
				scenario "multiple keywords from title" do
					visit root_path
					fill_in("q", with: "Opel advertisement, astra")
					click_on 'search_button'
					expect(page).to have_content(advertisements(:first_advertisement).title)
					expect(page).to have_content(advertisements(:third_advertisement).title)
					expect(page).to have_content(advertisements(:advertisement_4).title)
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
				end

				scenario "multiple keywords from title and information" do
					visit root_path
					fill_in("q", with: "Iron Diesel")
					click_on 'search_button'
					expect(page).to have_content(advertisements(:first_advertisement).title)
					expect(page).to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
				end
			end
		end	

	end

end
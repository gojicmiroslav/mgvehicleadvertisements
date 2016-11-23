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

	describe "Search feature", js: true do
		before(:all) do
			Capybara.register_driver :poltergeist do |app|
				Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
			end
			Capybara.javascript_driver = :poltergeist
		end

		after(:all) do
			Capybara.use_default_driver
		end

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
						#expect(page.all("a[@id='advertisement_#{advertisements(:first_advertisement).id}']").count).to eq(1)
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

		context 'advanced search' do
			scenario "with no select" do
				visit root_path
				click_on "advanced_search_button"
				expect(page).to have_content(advertisements(:first_advertisement).title)				
				expect(page).not_to have_content(advertisements(:second_advertisement).title)
				expect(page).to have_content(advertisements(:third_advertisement).title)
				expect(page).to have_content(advertisements(:advertisement_4).title)
				expect(page).to have_css('div.pagination')
			end

			context "category cars" do				
				context "vehicle brand" do
					scenario "without vehicle model" do
						visit root_path
						select(vehicle_brands(:opel).name, from: 'search_vehicle_brand', match: :first)
						click_on "advanced_search_button"
						expect(page).to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)
						expect(page).to have_content(advertisements(:third_advertisement).title)
						expect(page).not_to have_content(advertisements(:advertisement_4).title)
					end

					scenario "with vehicle model" do
						visit root_path
						select(vehicle_brands(:opel).name, from: 'search_vehicle_brand', match: :first)
						select(vehicle_models(:astra_g).name, from: 'search_vehicle_model', match: :first)
						click_on "advanced_search_button"
						expect(page).to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)
						expect(page).not_to have_content(advertisements(:advertisement_4).title)
					end
				end

				context "price" do
					scenario "with min price" do
						visit root_path
						select("30000€", from: "min_price")
						click_on "advanced_search_button"
						expect(page).to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)
						expect(page).to have_content(advertisements(:third_advertisement).title)
					end

					scenario "with max price" do
						visit root_path
						select("30000€", from: "max_price")
						click_on "advanced_search_button"
						expect(page).to have_content(advertisements(:advertisement_5).title)				
						expect(page).not_to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)
						expect(page).not_to have_content(advertisements(:third_advertisement).title)
					end

					scenario "with min and max price" do
						visit root_path
						select("4000€", from: "min_price")
						select("40000€", from: "max_price")
						click_on "advanced_search_button"
						expect(page).to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)
						expect(page).to have_content(advertisements(:third_advertisement).title)
						expect(page).not_to have_content(advertisements(:advertisement_4).title)
					end
				end

				context "year" do
					scenario "with min year" do
						visit root_path
						select("2016", from: "min_year")
						click_on "advanced_search_button"
						expect(page).to have_content(advertisements(:first_advertisement).title)				
						expect(page).to have_content(advertisements(:third_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)				
						expect(page).to have_content(advertisements(:advertisement_5).title)				
						expect(page).not_to have_content(advertisements(:advertisement_6).title)				
					end

					scenario "with max year" do
						visit root_path
						select("2015", from: "max_year")
						click_on "advanced_search_button"
						expect(page).not_to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:third_advertisement).title)				
						expect(page).not_to have_content(advertisements(:second_advertisement).title)				
						expect(page).to have_content(advertisements(:advertisement_5).title)				
						expect(page).to have_content(advertisements(:advertisement_6).title)				
					end

					scenario "with min and max year" do
						visit root_path
						select("2013", from: "min_year")
						select("2015", from: "max_year")
						click_on "advanced_search_button"
						expect(page).not_to have_content(advertisements(:first_advertisement).title)				
						expect(page).to have_content(advertisements(:advertisement_5).title)				
						expect(page).to have_content(advertisements(:advertisement_7).title)	
						expect(page).not_to have_content(advertisements(:second_advertisement).title)				
					end
				end

				scenario "with fuel" do
					visit root_path
					select(items(:diesel).name, from: 'fuel', match: :first)
					click_on "advanced_search_button"
					expect(page).to have_content(advertisements(:first_advertisement).title)				
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
					expect(page).not_to have_content(advertisements(:advertisement_4).title)
				end

				scenario "with engine" do
					visit root_path
					select(items(:cylinder_8).name, from: 'engine', match: :first)
					click_on "advanced_search_button"
					expect(page).to have_content(advertisements(:first_advertisement).title)				
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
					expect(page).not_to have_content(advertisements(:advertisement_4).title)
				end

				scenario "with drive" do
					visit root_path
					select(items(:awd).name, from: 'drive', match: :first)
					click_on "advanced_search_button"
					expect(page).to have_content(advertisements(:first_advertisement).title)				
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
					expect(page).not_to have_content(advertisements(:advertisement_4).title)
				end

				scenario "with air condition" do
					visit root_path
					select(items(:automatic_air_condition).name, from: 'air_condition', match: :first)
					click_on "advanced_search_button"
					expect(page).to have_content(advertisements(:first_advertisement).title)				
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
					expect(page).not_to have_content(advertisements(:advertisement_4).title)
				end

				scenario "with transmission" do
					visit root_path
					select(items(:manual).name, from: 'transmission', match: :first)
					click_on "advanced_search_button"
					expect(page).to have_content(advertisements(:first_advertisement).title)				
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
					expect(page).not_to have_content(advertisements(:advertisement_4).title)
				end

				scenario "with exterior color" do
					visit root_path
					select(items(:black_exterior_color).name, from: 'exterior_color', match: :first)
					click_on "advanced_search_button"
					expect(page).to have_content(advertisements(:first_advertisement).title)				
					expect(page).not_to have_content(advertisements(:second_advertisement).title)
					expect(page).not_to have_content(advertisements(:third_advertisement).title)
					expect(page).not_to have_content(advertisements(:advertisement_4).title)
				end

				context "combination" do
					scenario "with multiple parameters" do
						visit root_path
						select(vehicle_brands(:opel).name, from: 'search_vehicle_brand', match: :first)
						select(vehicle_models(:astra_g).name, from: 'search_vehicle_model', match: :first)
						select("4000€", from: "min_price")
						select("40000€", from: "max_price")
						select("2016", from: "min_year")
						select("2016", from: "max_year")
						select(items(:diesel).name, from: 'fuel', match: :first)
						click_on "advanced_search_button"

						expect(page).to have_content(advertisements(:first_advertisement).title)				
						expect(page).not_to have_content(advertisements(:third_advertisement).title)
						expect(page).not_to have_content(advertisements(:advertisement_4).title)
						expect(page).not_to have_content(advertisements(:second_advertisement).title)				
						expect(page).to have_content(advertisements(:advertisement_5).title)				
						expect(page).not_to have_content(advertisements(:advertisement_6).title)
					end
				end
			end
		end
	end
end
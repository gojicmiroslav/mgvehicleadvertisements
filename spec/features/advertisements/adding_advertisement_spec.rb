require "rails_helper"

RSpec.feature "Users Adding Advertisement", :feature do
	
	describe "Advertisement Form", js: true do
		fixtures :information_types
		fixtures :categories	
		fixtures :vehicle_brands
		fixtures :vehicle_models
		fixtures :options

		before(:all) do
  			#Capybara.current_driver = :selenium
  			Capybara.register_driver :poltergeist do |app|
   				Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
			end
			Capybara.javascript_driver = :poltergeist
		end

		after(:all) do
  			Capybara.use_default_driver
		end

		scenario "testing showing and hidding form" do
			visit new_advertisement_path	
			expect(page).to have_select('categories', selected: "Select...")
			expect(page).to have_content('Please select category to continue. Thank you!')
			expect(page).not_to have_css('#show-form')

			select(categories(:cars).name, :from => 'categories')
			expect(page).not_to have_content('Please select category to continue. Thank you!')
			expect(page).to have_css('#show-form')	

			select("Select...", :from => 'categories')
			expect(page).to have_content('Please select category to continue. Thank you!')
			expect(page).not_to have_css('#show-form')	

			select(categories(:trucks).name, :from => 'categories')
			expect(page).not_to have_content('Please select category to continue. Thank you!')
			expect(page).to have_css('#show-form')	

			select("Select...", :from => 'categories')
			expect(page).to have_content('Please select category to continue. Thank you!')
			expect(page).not_to have_css('#show-form')	

			select(categories(:bicycles).name, :from => 'categories')
			expect(page).not_to have_content('Please select category to continue. Thank you!')
			expect(page).to have_css('#show-form')		
		end				

		scenario "testing select vehicle brands and vehicle models" do
		 	visit new_advertisement_path
		 	select(categories(:cars).name, :from => 'categories')
		 	expect(page).to have_select('vehicle_brands')

		 	select(vehicle_brands(:opel).name, from: 'vehicle_brands', match: :first)
		 	select(vehicle_models(:astra_g).name, from: 'vm_select')

		 	fill_in('advertisement_title', :with => 'Test Title')
		 	fill_in('advertisement_description', :with => 'Test Description')

		 	fill_in('advertisement_price', :with => '3000.00')
		 	fill_in('advertisement_year', :with => '2003-01-01')

		 	select(vehicle_models(:astra_g).name, from: 'vm_select')

		 	#click_on("Add advertisement")
		 	#expect(page).to have_content("Advertisement successfully created.")
		end

		scenario "test options" do
			visit new_advertisement_path
			select(categories(:cars).name, :from => 'categories')
			#save_screenshot('screenshot.png')

			# test cars options
			expect(page).to have_no_checked_field(options(:navigation).name)
			expect(page).to have_no_checked_field(options(:cd_player).name)
			expect(page).to have_no_checked_field(options(:dvd_player).name)
			expect(page).to have_no_checked_field(options(:sunroof).name)
			expect(page).to have_no_checked_field(options(:power_locks).name)

			select(categories(:trucks).name, :from => 'categories')		
			expect(page).to have_no_checked_field(options(:navigation).name)
			expect(page).to have_no_checked_field(options(:cd_player).name)
			expect(page).to have_no_checked_field(options(:dvd_player).name)
			expect(page).to have_no_checked_field(options(:power_locks).name)
			expect(page).to have_no_checked_field(options(:heated_seats).name)
		end
	end

end
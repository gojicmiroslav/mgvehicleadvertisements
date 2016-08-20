require "rails_helper"

RSpec.feature "Adding Advertisement", :feature do
	
	describe "Adding Advertisement feature", js: true do
		fixtures :advertisement_types
		fixtures :users
		fixtures :information_types
		fixtures :information
		fixtures :items
		fixtures :categories	
		fixtures :vehicle_brands
		fixtures :vehicle_models
		fixtures :options

		before(:all) do
			Capybara.register_driver :poltergeist do |app|
    			Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
			end
			Capybara.javascript_driver = :poltergeist
		end

		after(:all) do
  			Capybara.use_default_driver
		end

		context "testing page layout" do
			# before(:context) do
			# 	signin(users(:miroslav).email, "password", false)
			# end

			scenario "showing and hidding form when categories select changes" do
				signin_login_page(users(:miroslav).email, 'password')
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
				signin_login_page(users(:miroslav).email, 'password')
				visit new_advertisement_path
				select(categories(:cars).name, :from => 'categories')
				expect(page).to have_select('vehicle_brands')
				select(vehicle_brands(:opel).name, from: 'vehicle_brands', match: :first)
				expect(page).to have_select('vm_select',selected: "Select...")
				select(vehicle_models(:astra_g).name, from: 'vm_select')	
			end
		end # page layout

		scenario "testing cars basic information,additional information and options" do
			signin_login_page(users(:miroslav).email, 'password')
			visit new_advertisement_path
			select(categories(:cars).name, :from => 'categories')

			categories(:cars).information.basic_information.each do |info|
				if !info.items.empty?
					expect(page).to have_select("advertisement[advertisement_informations][#{info.id}]", 
																			selected: "Select..." )		
				else
					expect(page).to have_field("advertisement[advertisement_informations][#{info.id}]")
				end
			end

			categories(:cars).information.additional_information.each do |info|
				name = info.name.downcase.gsub(' ', '_')
				if !info.items.empty?
					expect(page).to have_select("advertisement[#{name}]", 
																			selected: "Select..." )		
				else
					expect(page).to have_field("advertisement[#{info.name.downcase}]")
				end
			end

			categories(:cars).options.each do |info|
				expect(page).to have_no_checked_field "advertisement_options_#{info.name.downcase}"
			end			
		end

		scenario "testing bicycles basic information,additional information and options" do
			signin_login_page(users(:miroslav).email, 'password')
			visit new_advertisement_path
			select(categories(:bicycles).name, :from => 'categories')

			categories(:bicycles).information.basic_information.each do |info|
				if !info.items.empty?
					expect(page).to have_select("advertisement[advertisement_informations][#{info.id}]", 
																			selected: "Select..." )		
				else
					expect(page).to have_field("advertisement[advertisement_informations][#{info.id}]")
				end
			end

			categories(:bicycles).information.additional_information.each do |info|
				name = info.name.downcase.gsub(' ', '_')
				if !info.items.empty?
					expect(page).to have_select("advertisement[#{name}]", 
																			selected: "Select..." )		
				else
					expect(page).to have_field("advertisement[#{name}]")
				end
			end

			categories(:bicycles).options.each do |info|
				name = info.name.downcase.gsub(' ', '_')
				expect(page).to have_no_checked_field "advertisement_options_#{name}"
			end			
		end

		context "testing authenticate user" do
			scenario "user not logged in" do
				visit advertisements_path
				expect(current_path).to eq(new_user_session_path)
				expect(page).to have_content I18n.translate 'devise.failure.unauthenticated'
			end
		end

		context "VALIDA DATA" do
			scenario "user successfully adds cars advertisement" do
				signin_login_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:cars).name, :from => 'categories')
				select(vehicle_brands(:opel).name, from: 'vehicle_brands', match: :first)
				select(vehicle_models(:astra_g).name, from: 'vm_select', match: :first)	

				fill_in("advertisement[title]", with: "New Advertisement")
				fill_in("advertisement[price]", with: 50000)
				fill_in("advertisement[year]", with: '2016-03-14')

				# basic advertisement informations
				categories(:cars).information.basic_information.each do |info|
					fill_in("advertisement[advertisement_informations][#{info.id}]", with: rand(1000...5000))
				end

				# additional advertisement informations	
				select(items(:gasoline).name, from: "advertisement[fuel]")
				select(items(:coupe).name, from: "advertisement[style]") 
				select(items(:fwd).name, from: "advertisement[drive]")
				select(items(:semi_automatic).name, from: "advertisement[transmission]")
				select(items(:manual_air_condition).name, from: "advertisement[air_condition]")
				select(items(:cylinder_10).name, from: "advertisement[engine]")
				select(items(:blue_exterior_color).name, from: "advertisement[exterior_color]")
				select(items(:gold_exterior_color).name, from: "advertisement[interior_color]")

				categories(:cars).options.each do |info|
					name = info.name.downcase.gsub(' ', '_')
					check "advertisement_options_#{name}", match: :first
				end	

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.from(Advertisement.count).to(Advertisement.count + 1)

				expect(page).to have_content "Advertisement successfully created."
			end

			scenario "user successfully adds bicycle advertisement" do
				signin_front_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:bicycles).name, :from => 'categories')
				select(vehicle_brands(:boardman).name, from: 'vehicle_brands', match: :first)
				select(vehicle_models(:mountain_one).name, from: 'vm_select', match: :first)	

				fill_in("advertisement[title]", with: "New Bicycle Advertisement")
				fill_in("advertisement[price]", with: 1000)
				fill_in("advertisement[year]", with: '2015-03-14')

				# basic advertisement informations
				categories(:bicycles).information.basic_information.each do |info|
					if info.items.empty?
						fill_in("advertisement[advertisement_informations][#{info.id}]", with: rand(1000...5000))
					else
						select(items(:kids).name, from: "advertisement[advertisement_informations][#{info.id}]")
					end
				end

				# additional advertisement informations	
				select(items(:blue_color).name, from: "advertisement[color]")
				select(items(:v_break).name, from: "advertisement[breaks]") 
				select(items(:carbon).name, from: "advertisement[material]")
				select(items(:inch_17).name, from: "advertisement[size]")

				categories(:bicycles).options.each do |info|
					name = info.name.downcase.gsub(' ', '_')
					check "advertisement_options_#{name}", match: :first
				end	

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.from(Advertisement.count).to(Advertisement.count + 1)

				expect(page).to have_content "Advertisement successfully created."
			end
		end

		context "INVALID DATA" do
		
			scenario "unsuccessful adds car advertisement" do
				signin_login_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:cars).name, :from => 'categories')

				fill_in("advertisement[title]", with: "")
				fill_in("advertisement[price]", with: "")
				fill_in("advertisement[year]", with: '')

				# basic advertisement informations
				# ...nothing

				# additional advertisement informations	
				# ...nothing

				# options
				# ...nothing

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.by(0)

				expect(page).not_to have_content "Advertisement successfully created."
			end

			scenario "unsuccessful adds bicycle advertisement" do
				signin_login_page(users(:miroslav).email, 'password')

				visit new_advertisement_path
				select(categories(:bicycles).name, :from => 'categories')

				fill_in("advertisement[title]", with: "")
				fill_in("advertisement[price]", with: "")
				fill_in("advertisement[year]", with: '')

				# basic advertisement informations
				# ...nothing

				# additional advertisement informations	
				# ...nothing

				# options
				# ...nothing

				expect do
					click_button "Add advertisement"
				end.to change {Advertisement.count}.by(0)

				expect(page).not_to have_content "Advertisement successfully created."
			end	
		end
	end	
end
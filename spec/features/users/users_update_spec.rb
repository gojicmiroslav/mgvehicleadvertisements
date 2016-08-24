require 'rails_helper'

RSpec.feature "Users Update", :feature do
	fixtures :advertisement_types
	fixtures :information_types
	fixtures :information
	fixtures :items
	fixtures :categories	
	fixtures :vehicle_brands
	fixtures :vehicle_models
	fixtures :options
	fixtures :advertisements

	let(:user){ FactoryGirl.create(:user) }
	let(:other_user){ FactoryGirl.create(:other_user) }

	context "unauthenticated user" do
		scenario "should redirect edit when not logged in" do
			visit edit_user_registration_path(user)
			expect(page).to have_content(I18n.translate 'devise.failure.unauthenticated')	
		end
	end

	context "authenticated user" do
		before do
			login_as(user, :scope => :user)
		end

		scenario "should redirect edit when logged in as wrong user" do
			login_as(other_user, :scope => :user)
			visit edit_user_registration_path(other_user)

			#expect(current_path).to eq(edit_user_registration_path)
			expect(page).not_to have_content(other_user.firstname)
			expect(page).not_to have_content(other_user.lastname)
			expect(page).to have_content(user.firstname)
			expect(page).to have_content(user.lastname)
		end

		context "INVALID DATA" do		
			context "Invalid Email" do
				scenario "invalid email" do
					visit edit_user_registration_path(user)
					fill_in 'Email', :with => 'invalid'
					fill_in 'Current password', :with => user.password
					click_button 'Update'
					expect(page).to have_content("Email is invalid")
				end

				scenario "empty email" do
					visit edit_user_registration_path(user)
					fill_in 'Email', :with => ''
					fill_in 'Current password', :with => user.password
					click_button 'Update'
					expect(page).to have_content("Email can't be blank")
				end
			end

			context "Invalid Firstname" do
				scenario "empty firstname" do
					visit edit_user_registration_path(user)
					fill_in 'Firstname', :with => ''
					fill_in 'Current password', :with => user.password
					click_button 'Update'
					expect(page).to have_content("Firstname can't be blank")
				end

				scenario "firstname over 100 characters" do
					visit edit_user_registration_path(user)
					fill_in 'Firstname', :with => "a" * 101
					fill_in 'Current password', :with => user.password
					click_button 'Update'
					expect(page).to have_content("Firstname is too long")
				end
			end

			context "Invalid Lastname" do
				scenario "empty lastname" do
					visit edit_user_registration_path(user)
					fill_in 'Lastname', :with => ''
					fill_in 'Current password', :with => user.password
					click_button 'Update'
					expect(page).to have_content("Lastname can't be blank")
				end

				scenario "lastname over 100 characters" do
					visit edit_user_registration_path(user)
					fill_in 'Lastname', :with => "a" * 101
					fill_in 'Current password', :with => user.password
					click_button 'Update'
					expect(page).to have_content("Lastname is too long")
				end
			end

			context "Invalid Password" do
				scenario "password too short" do
					visit edit_user_registration_path(user)
					fill_in 'Password', :with => "123"
					click_button 'Update'
					expect(page).to have_content("Password is too short")
				end

				scenario "password and password_confirmation doesn't match" do
					visit edit_user_registration_path(user)
					fill_in 'Password', :with => "password123"
					fill_in 'Password confirmation', :with => "password321"
					click_button 'Update'
					expect(page).to have_content("Password confirmation doesn't match Password")
				end
			end
		end

		context "VALID DATA" do
			scenario "successful edit" do
				visit edit_user_registration_path(user)
				fill_in 'Email', :with => 'newemail@valid.com'
				fill_in 'Current password', :with => user.password
				click_button 'Update'
				expect(page).to have_content(I18n.translate 'devise.registrations.updated')
				#expect(page.current_url).to eq(user_path(user))
			end
		end
	end

end
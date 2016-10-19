require 'rails_helper'

feature "Users edit", type: :feature do
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
	let(:other_user) { FactoryGirl.create(:other_user) } 

	before do
		login_as(user, :scope => :user)
	end 

	scenario "should redirect edit when logged in as wrong user" do
 		visit edit_user_registration_path(other_user)
 
 		#expect(current_path).to eq(edit_user_registration_path)
 		expect(page).not_to have_content(other_user.firstname)
 		expect(page).not_to have_content(other_user.lastname)
 		expect(page).to have_content(user.firstname)
 		expect(page).to have_content(user.lastname)
 	end

end
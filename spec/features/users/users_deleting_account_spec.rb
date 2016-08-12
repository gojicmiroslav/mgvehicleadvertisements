require 'rails_helper'

RSpec.feature "Users Deleting Account", :feature do

	let(:user){ FactoryGirl.create(:user) }

	before do
		login_as(user, :scope => :user)
	end
	
	scenario "user deleting account" do
		visit edit_user_registration_path(user)
		expect do
			click_button 'Cancel my account'
		end.to change(User, :count).by(-1)	
		
		expect(page).to have_content(I18n.translate 'devise.registrations.destroyed')
		expect(page.current_path).to eq(root_path)

		visit new_user_session_path
		signin_front_page(user.email, user.password)
		expect(page).to have_content('Invalid Email or password.')
	end

end
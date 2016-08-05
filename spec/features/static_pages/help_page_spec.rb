require 'rails_helper'

feature 'Help page', type: :feature do
	scenario "should have title Help" do
		visit help_path
		expect(page).to have_selector("title", :text => full_title('Help'), :visible => false)
	end	
end
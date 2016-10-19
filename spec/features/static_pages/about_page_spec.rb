require 'rails_helper'

feature 'About page', type: :feature do
	scenario "should have title About" do
		visit about_path
		expect(page).to have_selector("title", :text => full_title('About'), :visible => false)
	end	
end
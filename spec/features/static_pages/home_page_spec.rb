require 'rails_helper'

feature 'Home page', type: :feature do

	scenario "visit home page" do
		visit root_path
		expect(page).to have_content("MG Vehicle Advertisements")
	end

	scenario "should have title Home" do
		visit root_path
		expect(page).to have_selector("title", :text => full_title, :visible => false)
	end	

end
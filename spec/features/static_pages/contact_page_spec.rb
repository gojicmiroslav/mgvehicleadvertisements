require 'rails_helper'

feature 'Contact page', type: :feature do
	scenario "should have title Contact" do
		visit contact_path
		expect(page).to have_selector("title", :text => full_title('Contact'), :visible => false)
	end	
end
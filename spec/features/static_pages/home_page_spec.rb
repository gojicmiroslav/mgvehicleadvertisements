require 'rails_helper'

feature 'Home page', type: :feature do

	scenario "should have title Home" do
		visit root_path
		expect(page).to have_selector("title", :text => full_title, :visible => false)
	end	

	context "User Logged In" do
		let(:valid_user){ FactoryGirl.create(:user) }

		it "should have advertisements link" do
			signin_front_page(valid_user.email, valid_user.password)
			visit root_path
			expect(page).to have_link("Advertisements", href: advertisements_path)
		end
	end

	context "User NOT Logged In" do

		it "should not have advertisements link" do
			visit root_path
			expect(page).not_to have_link("Advertisements", href: advertisements_path)		
		end
	end

end
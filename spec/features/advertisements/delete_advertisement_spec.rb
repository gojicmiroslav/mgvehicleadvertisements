require "rails_helper"

RSpec.feature "Delete Advertisement", :feature do
	
	describe "Deleting Advertisement feature" do
		fixtures :advertisement_types
		fixtures :users
		fixtures :information_types
		fixtures :information
		fixtures :items
		fixtures :categories	
		fixtures :vehicle_brands
		fixtures :vehicle_models
		fixtures :options
		fixtures :advertisements

		let(:user){ users(:miroslav) }
		before do
			login_as(user, :scope => :user)
		end

		scenario "delete advertisement" do
			visit advertisements_path

			expect do
				first(:link, "Delete").click
			end.to change {Advertisement.count}.by(-1)
		end
	end
end
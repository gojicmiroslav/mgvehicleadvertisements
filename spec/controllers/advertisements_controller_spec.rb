require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
	fixtures :advertisement_types
  	fixtures :users
  	fixtures :categories
  	fixtures :vehicle_brands
  	fixtures :vehicle_models
  	fixtures :options
  	fixtures :advertisements

	let(:advertisement) { advertisements(:first_advertisement) }

	describe "GET index" do
		it "renders :index template" do				
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "GET show" do
		it "renders :show template" do
			get :show, id: advertisement
			expect(response).to render_template(:show)
		end

		it "assigns requested advertisement to template" do
			get :show, id: advertisement
			expect(assigns(:advertisement)).to eq(advertisement)
		end
	end

	describe "GET new" do
		it "renders :new template" do
			get :new
			expect(response).to render_template(:new)
		end

		it "assigns new advertisement object to template" do
			get :new
			expect(assigns(:advertisement)).to be_a_new(Advertisement)
		end
	end
end
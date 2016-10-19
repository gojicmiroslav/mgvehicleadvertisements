require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	let(:user){ FactoryGirl.create(:user) }

	describe "GET show" do
		context "authenticated user" do
			before do
				sign_in(user)
			end

			it "renders :show template" do
				get :show, id: user
				expect(response).to render_template(:show)
			end

			it "assigns authenticated user to template" do
				get :show, id: user
				expect(assigns(:user)).to eq(user)
			end
		end

		context "non-authenticated user" do
			it "redirect to login page" do
				get :show, id: user
				expect(flash[:alert]).to eq(I18n.translate 'devise.failure.unauthenticated')
				expect(response).to redirect_to new_user_session_path
			end
		end
	end

end
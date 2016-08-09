require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

    let(:user){ FactoryGirl.create(:user) }

	before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it "returns http success" do
    	get :new
        expect(response).to have_http_status(:success)
    end

    it "should redirect edit when not logged in" do
      	get :edit
      	expect(response).not_to render_template("edit")
      	expect(flash[:alert]).not_to be_nil
      	expect(flash[:alert]).to be_present
      	expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      	expect(response).to redirect_to new_user_session_path
    end

    it "should redirect update when not logged in" do
      	patch :update, id: user, user: { firstname: user.firstname, lastname: user.lastname, email: user.email }
      	expect(response).to redirect_to new_user_session_path
    end

end
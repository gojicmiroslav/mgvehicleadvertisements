require 'rails_helper'

RSpec.describe Category, type: :model do
	it { should validate_presence_of :name }

	it { should have_and_belong_to_many :vehicle_brands }
	it { should have_and_belong_to_many :options }
	it { should have_many :vehicle_models }
	it { should have_many :advertisements }
end
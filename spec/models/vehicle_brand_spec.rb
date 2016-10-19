require 'rails_helper'

RSpec.describe VehicleBrand, type: :model do
  it { should validate_presence_of :name }
  it { should have_and_belong_to_many :categories }
  it { should have_many :vehicle_models }
end
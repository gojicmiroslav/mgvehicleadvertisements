require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
	it { should validate_presence_of :name }
	it { should belong_to :vehicle_brand }
 	it { should belong_to :category }
end
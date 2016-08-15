require 'rails_helper'

RSpec.describe Fuel, type: :model do
	it { should have_many :advertisements }
	it { should validate_presence_of(:name) }
end

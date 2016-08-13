require 'rails_helper'

RSpec.describe Engine, type: :model do

	it {should validate_presence_of(:name)}
end
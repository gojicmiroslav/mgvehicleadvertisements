require 'rails_helper'

RSpec.describe Color, type: :model do
	it {should validate_presence_of(:name)}
	it { should have_many(:exterior_colors).class_name('Advertisement') }
 	it { should have_many(:interior_colors).class_name('Advertisement') }
end
require 'rails_helper'

RSpec.describe Advertisement, type: :model do
	it { should belong_to :engine }
 	it { should belong_to :fuel }
 	it { should belong_to :drive }
 	it { should belong_to :style }
 	it { should belong_to :air_condition }
 	it { should belong_to :transmission }
 	it { should belong_to :user }
 	it { should belong_to :category }
 	it { should belong_to :vehicle_model }
 	it { should belong_to :advertisement_type }
 	it { should have_and_belong_to_many :options }
 	it { should belong_to(:exterior_color).class_name('Color')  }
 	it { should belong_to(:interior_color).class_name('Color')  }

	it {should validate_presence_of(:title)}
end
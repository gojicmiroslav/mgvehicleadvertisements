require "rails_helper"

RSpec.describe InformationType, type: :model do
	fixtures :advertisement_types
	fixtures :users
	fixtures :information_types
	fixtures :information
	fixtures :items
	fixtures :categories	
	fixtures :vehicle_brands
	fixtures :vehicle_models
	fixtures :options
	fixtures :advertisements
	fixtures :advertisement_information

	let(:basic){ information_types(:basic) }

  context "refactoring" do
  		it "returns information type by information name" do
  			id = InformationType.get_id_by_name("Basic")
  			expect(id).to eq(basic.id)
  		end

  		it "returns nil for unknown information name" do
  			id = InformationType.get_id_by_name("Unknown")
  			expect(id).to be_nil
  		end

  		it "returns nil for empty information name" do
  			id = InformationType.get_id_by_name("")
  			expect(id).to be_nil
  		end
	end

	context "associations" do
		it { should have_many :informations }
	end
end
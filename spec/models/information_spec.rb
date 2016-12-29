require 'rails_helper'

RSpec.describe Information, type: :model do
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

	let(:fuel){ information(:fuel) }
	let(:no_items_information){ information(:no_items_information) }
	let(:advertisement){ advertisements(:first_advertisement) }
	let(:diesel){ items(:diesel) }
	let(:fuel_advertisement_information){ advertisement_information(:fuel_advertisement_information) }
	
	context "refactoring" do
		context "get_advertisement_information_item" do
			it "returns item id for given advertisement" do
				item_id = fuel.get_advertisement_information_item(advertisement)
				expect(item_id).to eq(diesel.id)
			end

			it "returns nil for passed non-existing advertisement" do
				item_id = fuel.get_advertisement_information_item(nil)
				expect(item_id).to be_nil
			end
		end

		context "get advertisement information item id" do
			it "returns item id for given advertisement and information" do
				item_id = fuel.get_advertisement_information_item_id(fuel_advertisement_information)
				expect(item_id).to eq(diesel.id)
			end

			it "returns nil if advertisement information is nil" do
				item_id = fuel.get_advertisement_information_item_id(nil)
				expect(item_id).to be_nil
			end
		end

		context "get item id" do
			context "valid advertisement information value" do
				it "returns item id" do
					id = fuel.get_item_id(fuel_advertisement_information.value)
					expect(id).to eq(diesel.id)
				end
			end

			context "invalid advertisement information value" do
				it "returns nil for passed nil" do
					id = fuel.get_item_id(nil)
					expect(id).to be_nil
				end

				it "returns nil for passed empty string" do
					id = fuel.get_item_id("")
					expect(id).to be_nil
				end
			end
		end

		context 'get id from items' do
			context "self.items exists" do
				it "returns item id if value exists" do
					id = fuel.get_id_from_items(fuel_advertisement_information.value)
					expect(id).to eq(diesel.id)
				end

				it "returns nil if value does not exist" do
					id = fuel.get_id_from_items("Tttttttt")
					expect(id).to be_nil
				end
			end

			context "self.items is nil" do
				it "returns nil" do
					id = no_items_information.get_id_from_items(fuel_advertisement_information.value)
					expect(id).to be_nil
				end
			end
		end
	end

	context "associations" do
		it { should belong_to :information_type }
		it { should have_many :advertisement_informations }
		it { should have_many(:advertisements).through(:advertisement_informations) }
		it { should have_and_belong_to_many :items }
	end

end 
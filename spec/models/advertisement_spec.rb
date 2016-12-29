require "rails_helper"

RSpec.describe Advertisement, type: :model do
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

	let(:advertisement){ advertisements(:first_advertisement) }

	# basic information
	let(:capacity){ information(:capacity) }
	let(:power){ information(:power) }
	let(:mileage){ information(:mileage) }

	# additional information
	let(:fuel){ information(:fuel) }
	let(:style){ information(:style) }
	let(:drive){ information(:drive) }
	let(:transmission){ information(:transmission) }
	let(:air_condition){ information(:air_condition) }
	let(:engine){ information(:engine) }
	let(:exterior_color){ information(:exterior_color) }
	let(:interior_color){ information(:interior_color) }

  context "show action" do
  	# information types
  	let(:basic){ information_types(:basic) }
  	let(:additional){ information_types(:additional) }

		# advertisement information
		let(:capacity_advertisement_information){ advertisement_information(:capacity_advertisement_information) }
		let(:power_advertisement_information){ advertisement_information(:power_advertisement_information) }
		let(:mileage_advertisement_information){ advertisement_information(:mileage_advertisement_information) }
	
		context "get_basic_advertisement_information" do
			let(:basic_advertisement_information_hash) do
				{
					mileage.name => "4500",
					power.name => "4500",
					capacity.name => "3000"
				}
			end

			it "returns basic advertisement information for given advertisement" do
				basic_advertisement_information = advertisement.get_basic_advertisement_information
				expect(basic_advertisement_information).to match(basic_advertisement_information_hash)
			end
		end

		context "get_additional_advertisement_information" do
			let(:additional_advertisement_information_hash) do
				{
					fuel.name => 'Diesel',
					style.name => 'Commercial',
					drive.name => 'AWD',
					transmission.name => 'Manual',
					air_condition.name => 'Automatic',
					engine.name => '8 cylinder',
					exterior_color.name => 'Black',
					interior_color.name => 'Silver'
				}
			end

			it "returns additional advertisement information for given advertisement" do
				additional_advertisement_information = advertisement.get_additional_advertisement_information
				expect(additional_advertisement_information).to match(additional_advertisement_information_hash)
			end
		end

		context "initial array for" do
			context "basic information" do
				let(:basic_information_initial_hash) do
					{
						mileage.name => "",
						power.name => "",
						capacity.name => ""
					}
				end

				it "basic information" do
					basic_information_arr = advertisement.create_initial_information_array_for(basic.id)
					expect(basic_information_arr).to match(basic_information_initial_hash)
				end
			end

			context "additional information" do
				let(:additional_advertisement_information_hash) do
					{
						fuel.name => '',
						style.name => '',
						drive.name => '',
						transmission.name => '',
						air_condition.name => '',
						engine.name => '',
						exterior_color.name => '',
						interior_color.name => ''
					}
				end

				it "additional information" do
					additional_information_arr = advertisement.create_initial_information_array_for(additional.id)
					expect(additional_information_arr).to match(additional_advertisement_information_hash)
				end
			end
		end				

		context "fill initial array" do
			it "return nil if passed array is nil" do
				arr = advertisement.fill_initial_arr_for(nil)
				expect(arr).to be_nil
			end

			context "basic information" do
				let(:basic_information_initial_hash) do
					{
						mileage.name => "",
						power.name => "",
						capacity.name => ""
					}
				end

				let(:basic_advertisement_information_hash) do
					{
						mileage.name => "4500",
						power.name => "4500",
						capacity.name => "3000"
					}
				end

				it "returns basic information array" do
					basic_information = advertisement.fill_initial_arr_for(basic_information_initial_hash)
					expect(basic_information).to match(basic_advertisement_information_hash)
				end
			end
		end
	end

	context "save all" do
		let(:cars){ categories(:cars) }
		let(:astra_g){ vehicle_models(:astra_g) }
		let(:user){ users(:miroslav) }
		let(:used){ advertisement_types(:used) }

		let(:new_advertisement) do
			Advertisement.new(
				title: "New Advertisement",
				price: 2400,
				year: Time.now,
				category_id: cars.id,
				vehicle_model_id: astra_g.id,
				user_id: user.id,
				advertisement_type_id: used.id
			)
		end

		context "without advertisement information" do
			it "saves advertisement in database" do
				expect(new_advertisement.new_record?).to be true
				new_advertisement.save_all(nil)
				expect(new_advertisement.new_record?).to be false
			end
		end

		context "with advertisement information" do
			let(:advertisement_information) do
				{
					mileage.id => "2000",
					power.id => "5000",
					capacity.id => "3000"
				}
			end

			it "saves advertisement in database" do
				expect(new_advertisement.new_record?).to be true
				new_advertisement.save_all(advertisement_information)
				expect(new_advertisement.new_record?).to be false
			end
		end		

		context "new_advertisement_information" do
			it "returns nil if info_id is nil" do
				advertisement_information = advertisement.new_advertisement_information(nil, "Test")
				expect(advertisement_information).to be_nil
			end

			it "returns nil if value is nil" do
				advertisement_information = advertisement.new_advertisement_information(2, nil)
				expect(advertisement_information).to be_nil
			end

			it "returns nil if value is empty" do
				advertisement_information = advertisement.new_advertisement_information(2, "")
				expect(advertisement_information).to be_nil
			end

			it "returns nil if information does not exist" do
				advertisement_information = advertisement.new_advertisement_information(2, "Test")
				expect(advertisement_information).to be_nil
			end
		end

		context "find information" do
			it "does not raise an exception for invalid information id" do
				expect {
					advertisement.find_information(-2)
				}.not_to raise_exception
			end
		end
	end

	context "validation" do
		it{ should validate_presence_of :title }
		it{ should validate_presence_of :price }
		it{ should validate_presence_of :year }
		it{ should validate_presence_of :vehicle_model }
		it{ should validate_presence_of :user }
	end

	context "associations" do
		it { should belong_to(:user).validate(true) }
		it { should belong_to(:category).validate(true) }
		it { should belong_to(:vehicle_model).validate(true) }
		it { should belong_to :advertisement_type }
		it { should have_and_belong_to_many :options }
		it { should have_many :advertisement_informations }
		it { should have_many(:informations).through(:advertisement_informations) }
		it { should have_many :comments }
	end
end
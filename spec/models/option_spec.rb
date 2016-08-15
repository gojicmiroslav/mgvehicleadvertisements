require 'rails_helper'

RSpec.describe Option, type: :model do
	it { should have_and_belong_to_many :advertisements }
	it { should validate_presence_of :name }
end
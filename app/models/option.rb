class Option < ApplicationRecord
	has_and_belongs_to_many :advertisements
	validates :name, presence: :true
end
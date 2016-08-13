class Drive < ApplicationRecord
	validates :name, presence: :true
end
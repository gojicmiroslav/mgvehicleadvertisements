class Advertisement < ApplicationRecord
	validates :title, presence: :true
end
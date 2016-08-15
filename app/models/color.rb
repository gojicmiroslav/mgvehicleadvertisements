class Color < ApplicationRecord
	validates :name, presence: true

	has_many :exterior_colors, class_name: 'Advertisement', foreign_key: :exterior_color_id
 	has_many :interior_colors, class_name: 'Advertisement', foreign_key: :exterior_color_id
end
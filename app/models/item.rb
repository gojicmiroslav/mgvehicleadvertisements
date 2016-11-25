class Item < ActiveRecord::Base
 	has_and_belongs_to_many :information
 	has_and_belongs_to_many :categories

 	def self.search(term)
 		where("name LIKE :term", term: "#{term}%").distinct.pluck(:name)
 	end
end
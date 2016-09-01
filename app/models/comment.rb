class Comment < ApplicationRecord
	validates :author, presence: true
 	validates :body, presence: true
 
 	belongs_to :advertisement
 	validates :advertisement, presence: true
 
 	has_ancestry
end
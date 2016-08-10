FactoryGirl.define do

	factory :category do
 		name "Text Category 1"
 		description "Test category Description"
 	end
 
 	factory :category2, parent: :category do
 		name "Text Category 2"
 		description "Test category Description"
 	end

end
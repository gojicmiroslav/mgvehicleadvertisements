FactoryGirl.define do
	
	factory :user do
    transient do
      skip_confirmation true
    end

    firstname "Miroslav"
    lastname "Gojic"
    sequence(:email){ |n| "email#{n}@email.com"} 
    password "please123"
    
    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end
  end

  factory :other_user, parent: :user do
    firstname "Other"
    lastname "User"
    password "otheruser"
  end
  
end
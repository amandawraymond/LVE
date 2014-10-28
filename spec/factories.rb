FactoryGirl.define do
  factory :artist do
    name
    similar 
    user 
  end

  sequence :name do |n|
    "Name-#{n}"
  end 

  sequence :email do |n|
    "email-#{n}@email.com"
  end 

  factory :user do
    name
    email 
    password              "foobar"
    password_confirmation "foobar"

  end
end


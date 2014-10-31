FactoryGirl.define do
  sequence :name do |n|
    "Name-#{n}"
  end 

  sequence :email do |n|
    "email-#{n}@email.com"
  end 

  factory :artist do
    name
    similar " "
    photo " "
    user 
  end

  factory :user do
    name
    email 
    password              "foobar"
    password_confirmation "foobar"
  end

  factory :concert do
    concert_date        "23/08/1988.to_date"
    concert_time        "7:00"
    performing_artists  "Cher, Radiohead"
    venue               "Tabernacle"
    website             "www.lastfm.com"
    user
  end

end


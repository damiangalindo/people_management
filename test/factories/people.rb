FactoryGirl.define do
  factory :person do
    first_name          Faker::Name.first_name
    last_name           Faker::Name.last_name
    sequence(:email, 1) { |n| "email#{n}@example.com" }
    job                 Faker::Name.title
    bio                 Faker::Lorem.paragraph
    gender              1
    birthdate           '2017-01-13'
    picture             Faker::Internet.url
  end
end
# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string(75)       not null
#  last_name  :string(75)       not null
#  email      :string(254)      not null
#  job        :string(75)
#  bio        :text(65535)
#  gender     :integer
#  birthdate  :date             not null
#  picture    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

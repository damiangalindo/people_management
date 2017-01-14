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
#  gender     :string(255)      not null
#  birthdate  :date             not null
#  picture    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :person do
    first_name          Faker::Name.first_name
    last_name           Faker::Name.last_name
    sequence(:email) { |n| "email#{n}@example.com" }
    job                 Faker::Name.title
    bio                 Faker::Lorem.paragraph
    gender              'male'
    birthdate           Date.today - 20.years
    picture             Faker::Internet.url
  end
end

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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  context 'Validations' do
    should validate_presence_of(:email)
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:birthdate)
    should_not validate_presence_of(:job)

    should validate_length_of(:email).is_at_most(254)
    should validate_length_of(:first_name).is_at_most(75)
    should validate_length_of(:last_name).is_at_most(75)
    should validate_length_of(:job).is_at_most(75)

    should validate_numericality_of(:gender)

    should validate_uniqueness_of(:email).case_insensitive

    should_not allow_value('test').for(:email)
    should allow_value('test@example.com').for(:email)
  end

  # def test_after_create
  #   person = FactoryGirl.build(:person)
  #   person.expects(:call).with(:create).returns(true)
  #   assert person.save
  # end

  # def test_after_destroy
  #   person = FactoryGirl.create(:person)
  #   person.expects(:call).with(:destroy).returns(true)
  #   assert person.destroy
  # end
end

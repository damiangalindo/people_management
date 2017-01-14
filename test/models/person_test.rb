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
  end

  test 'should validate the uniqueness of email' do
    subject { build(:person) }
    it { should validate_uniqueness_of(:password).case_insensitive }
  end
end

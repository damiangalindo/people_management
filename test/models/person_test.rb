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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  context 'Validations' do
    # presence
    should validate_presence_of(:email)
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:birthdate)
    should validate_presence_of(:gender)
    should_not validate_presence_of(:job)

    # lenght
    should validate_length_of(:email).is_at_most(254)
    should validate_length_of(:first_name).is_at_most(75)
    should validate_length_of(:last_name).is_at_most(75)
    should validate_length_of(:job).is_at_most(75)

    # content
    should_not allow_value(Date.today + 1.day).for(:birthdate)
    should_not allow_value('test').for(:email)
    should allow_value('test@example.com').for(:email)
    should allow_value('male').for(:gender)
    should_not allow_value('other').for(:gender)
  end

  def validate_email_uniqueness
    person = Person.create(:person)
    new_person = Person.build(:person, email: person.email)
    asser_equal new_person.valid?, false
  end

  def test_after_create
    person = FactoryGirl.build(:person)
    person.expects(:send_mail_new_person).returns(true)
    assert person.save
  end

  def test_after_destroy
    person = FactoryGirl.create(:person)
    person.expects(:send_mail_deleted_person).returns(true)
    assert person.destroy
  end
end

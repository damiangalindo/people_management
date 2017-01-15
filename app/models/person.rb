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

class Person < ActiveRecord::Base
  # constants
  # Public: Array to validate inclusion for gender
  GENDER = %w( male female ).freeze

  # scopes
  # Public: Scope to return people ordered by their first name and last name
  default_scope { order('first_name ASC, last_name ASC') }

  # validations
  schema_validations except: [:email, :gender]
  validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 254 }, email_format: true
  validates :gender, inclusion: { in: GENDER }, presence: true
  validate :birthdate_not_in_the_future

  # callbacks
  after_create :send_mail_new_person
  after_destroy :send_mail_deleted_person

  private

  # Private: Send email when a person is created
  def send_mail_new_person
    Resque.enqueue(EmailSenderJob, self, 'new_person_added')
  end

  # Private: Send email when a person is deleted
  def send_mail_deleted_person
    person = { first_name: self.first_name, last_name: self.last_name }
    Resque.enqueue(EmailSenderJob, person, 'person_deleted')
  end

  # Private: Validate if the birth date is greater than today
  def birthdate_not_in_the_future
    if birthdate && birthdate > Date.today
      errors.add(:birthdate, 'you can\'t pick a date in the future as your birth date')
    end
  end
end

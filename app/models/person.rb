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

class Person < ActiveRecord::Base
  schema_validations except: :email

  validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 254 }, email_format: true

  after_create :send_mail_new_person

  after_destroy :send_mail_deleted_person

  def age
    ((Time.now - Time.parse(birthdate.to_s)) / 1.year).round
  end

  private

  def send_mail_new_person
    Resque.enqueue(EmailSenderJob, self, 'new_person_added')
  end

  def send_mail_deleted_person
    person = { first_name: self.first_name, last_name: self.last_name }
    Resque.enqueue(EmailSenderJob, person, 'person_deleted')
  end
end

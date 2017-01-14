class Person < ActiveRecord::Base
  schema_validations

  after_create :send_mail

  def send_mail
    Resque.enqueue(EmailSenderJob, self.id)
  end
end

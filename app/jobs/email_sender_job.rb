# Public: Job to send emails in background
# Examples
#
#   EmailSenderJob.Resque.enqueue(EmailSenderJob, person, 'person_deleted')
#

class EmailSenderJob
  @queue = :emails_queue

  def self.perform(person, mail_to_send)
    case mail_to_send
    when 'new_person_added'
      send_new_person_email(person)
    when 'person_deleted'
      send_deleted_person_email(person)
    end
  end

  # Public: Send an email to everyone in the app except the recently created one
  def self.send_new_person_email(not_included_person)
    people = Person.where.not(id: not_included_person['id'])
    people.each do |person|
      PersonMailer.new_person_added(person, not_included_person).deliver_now
    end
  end

  # Public: Send an email to everyone in the app except the recently deleted one
  def self.send_deleted_person_email(deleted_person)
    people = Person.all
    people.each do |person|
      PersonMailer.person_deleted(person, deleted_person).deliver_now
    end
  end
end
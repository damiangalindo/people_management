# Public: Send emails
#
# Example:
#   PersonMailer.new_person_added(person, new_person).deliver_now
#   # => send an email to the person about the person recently added
#
#   PersonMailer.person_deleted(person, deleted_person).deliver_now
#   # => send an email to the person about the person recently deleted

class PersonMailer < ApplicationMailer
  def new_person_added(person, new_person)
    @person = person.decorate
    @new_person = new_person
    mail(to: @person.email, subject: 'People App - New person added')
  end

  def person_deleted(person, deleted_person)
    @person = person.decorate
    @deleted_person = deleted_person
    mail(to: @person.email, subject: 'People App - Person deleted')
  end
end

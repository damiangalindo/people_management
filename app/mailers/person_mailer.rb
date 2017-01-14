class PersonMailer < ApplicationMailer
  def new_person_added(person, new_person)
    @person = person
    @new_person = new_person
    mail(to: @person.email, subject: 'People App - New person added')
  end

  def person_deleted(person, deleted_person)
    @person = person
    @deleted_person = deleted_person
    mail(to: @person.email, subject: 'People App - Person deleted')
  end
end

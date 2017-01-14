class PersonMailer < ApplicationMailer
  def new_person_added(person, new_person)
    @person = person
    @new_person = new_person
    mail(to: @person.email, subject: 'People App - New person added')
  end
end

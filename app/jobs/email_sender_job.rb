class EmailSenderJob
  @queue = :emails_queue

  def self.perform(not_included_person_id)
    new_person = Person.find not_included_person_id
    people = Person.where.not(id: not_included_person_id)
    people.each do |person|
      PersonMailer.new_person_added(person, new_person).deliver_now
    end
  end
end
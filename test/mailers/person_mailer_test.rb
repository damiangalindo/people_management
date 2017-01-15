require 'test_helper'

class PersonMailerTest < ActionMailer::TestCase
  test "new_person_added" do
    person = FactoryGirl.create(:person).decorate
    new_person = FactoryGirl.create(:person)

    email = PersonMailer.new_person_added(person, new_person)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['no-reply@people_management.com'], email.from
    assert_equal [person.email], email.to
    assert_equal 'People App - New person added', email.subject
    assert_match /Hello #{person.full_name}/, email.body.to_s
    assert_match /has joined the application/, email.body.to_s
  end

  test "person_deleted" do
    person = FactoryGirl.create(:person).decorate
    deleted_person = FactoryGirl.create(:person)

    email = PersonMailer.person_deleted(person, deleted_person)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['no-reply@people_management.com'], email.from
    assert_equal [person.email], email.to
    assert_equal 'People App - Person deleted', email.subject
    assert_match /Hello #{person.full_name}/, email.body.to_s
    assert_match /has left the application/, email.body.to_s
  end
end

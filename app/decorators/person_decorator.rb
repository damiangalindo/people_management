class PersonDecorator < Draper::Decorator
  delegate_all

  # Public: Transform the birth date to the person's age
  #
  # Example:
  #
  #   person.birthdate => '1990-01-01'
  #   decorated_person = PersonDecorator.new(person)
  #   decorated_person.age == 27
  def age
    ((Time.now - Time.parse(birthdate.to_s)) / 1.year).round
  end

  # Public: Return the full name of a person
  #
  # Example:
  #
  #   person.first_name => 'Test'
  #   person.last_name => 'Something'
  #   decorated_person = PersonDecorator.new(person)
  #   decorated_person.full_name == 'Test Something'
  def full_name
    "#{first_name} #{last_name}"
  end

  # Public: Titleize the gender name
  #
  # Example:
  #
  #   person.gender => 'female'
  #   decorated_person = PersonDecorator.new(person)
  #   decorated_person.gender_title == 'Female'
  def gender_title
    gender.titleize
  end

  # Public: Return the picture or a default one
  #
  # Example:
  #
  #   person.picture => ''
  #   decorated_person = PersonDecorator.new(person)
  #   decorated_person.get_picture == 'https://diasp.eu/assets/user/default.png'
  def get_picture
    picture.blank? ? 'https://diasp.eu/assets/user/default.png' : picture
  end
end

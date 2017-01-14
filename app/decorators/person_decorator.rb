class PersonDecorator < Draper::Decorator
  delegate_all

  def age
    ((Time.now - Time.parse(birthdate.to_s)) / 1.year).round
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def gender_title
    gender.titleize
  end

  def get_picture
    picture.blank? ? 'https://diasp.eu/assets/user/default.png' : picture
  end
end

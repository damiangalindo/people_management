require 'test_helper'

class PersonDecoratorTest < Draper::TestCase
  def setup
    @person = FactoryGirl.create(:person, picture: '')
    @decorated_person = @person.decorate
  end

  def test_decorated_attributes
    assert_equal @decorated_person.full_name, "#{@person.first_name} #{@person.last_name}"
    assert_equal @decorated_person.age, 20
    assert_equal @decorated_person.get_picture, 'https://diasp.eu/assets/user/default.png'
  end
end

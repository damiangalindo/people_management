require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    person = FactoryGirl.create(:person)
    get :edit, id: person.id
    assert_response :success
  end

  test 'should create a Person' do
    person = FactoryGirl.attributes_for(:person)
    assert_difference('Person.count', 1) do
      post :create, person: person
    end
  end

  test 'should update a Person' do
    person = FactoryGirl.create(:person)
    params = FactoryGirl.attributes_for(:person)
    assert_difference('Person.count', 0) do
      put :update, id: person.id, person: params
    end
    assert_response 302
  end

  test 'should delete a Person' do
    person = FactoryGirl.create(:person)
    assert_difference('Person.count', -1) do
      delete :destroy, id: person.id
    end
  end
end

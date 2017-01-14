require 'test_helper'

class PersonIntegrationTest < Capybara::Rails::TestCase
  feature 'Can Access Home' do
    scenario 'has person full_name' do
      person = FactoryGirl.create(:person).decorate
      visit root_path
      page.must_have_content person.full_name
    end

    scenario 'Create a person' do
      visit root_path
      click_link('Create a person')
      page.must_have_content 'New Person'

      fill_in 'birthdate', with: '10/10/1990'
      fill_in 'first_name', with: 'Test'
      fill_in 'last_name', with: 'Lastname'
      select 'male', from: 'person_gender'
      fill_in 'email', with: 'email@example.com'

      click_button 'Send'

      page.must_have_content 'Test Lastname'
    end

    scenario 'Show error when missing required field' do
      visit root_path
      click_link('Create a person')
      page.must_have_content 'New Person'

      fill_in 'birthdate', with: '10/10/1990'
      fill_in 'last_name', with: 'Lastname'
      fill_in 'email', with: 'email@example.com'

      click_button 'Send'

      page.must_have_content 'can\'t be blank'
    end

    scenario 'Show error when date is in the future' do
      visit root_path
      click_link('Create a person')
      page.must_have_content 'New Person'

      fill_in 'birthdate', with: '10/10/2020'
      fill_in 'first_name', with: 'Test'
      fill_in 'last_name', with: 'Lastname'
      fill_in 'email', with: 'email@example.com'

      click_button 'Send'

      page.must_have_content 'you can\'t pick a date in the future as your birth date'
    end

    scenario 'Show a person information' do
      person = FactoryGirl.create(:person).decorate
      visit root_path
      click_link(person.full_name)
      page.must_have_content person.full_name
      page.must_have_content person.birthdate
      page.must_have_content 'cancel'
      page.must_have_content 'delete'
      page.must_have_content 'edit'
    end

    scenario 'Edit a person information Form' do
      person = FactoryGirl.create(:person).decorate
      visit root_path
      click_link(person.full_name)
      page.must_have_content person.full_name
      page.must_have_content person.birthdate
      page.must_have_content 'cancel'
      page.must_have_content 'delete'
      page.must_have_content 'edit'
      click_link('edit')
      page.must_have_content 'Edit Person'
      fill_in 'first_name', with: 'Test'
      page.click_button 'Send'
      page.has_xpath?('//h1/Test')
    end
  end
end
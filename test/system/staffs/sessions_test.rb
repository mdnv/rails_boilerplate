# frozen_string_literal: true

require 'application_system_test_case'

module Staffs
  class SessionsTest < ApplicationSystemTestCase
    setup do
      @staff = staffs(:valid_administrator)
      visit new_staff_session_url
    end

    test 'sign in fail because of not created account' do
      within '#new_staff' do
        fill_in 'staff[email]', with: 'wrong_email@example.com'
        fill_in 'staff[password]', with: 'password'
        click_on I18n.t('views.actions.sign_in')
      end

      assert_text I18n.t('devise.failure.not_found_in_database',
                         authentication_keys: Staff.human_attribute_name(:email))
    end

    test 'sign in fail because of wrong password' do
      within '#new_staff' do
        fill_in 'staff[email]', with: @staff.email
        fill_in 'staff[password]', with: 'wrong_password'
        click_on I18n.t('views.actions.sign_in')
      end

      assert_text I18n.t('devise.failure.invalid',
                         authentication_keys: Staff.human_attribute_name(:email))
    end

    test 'sign in successfully' do
      within '#new_staff' do
        fill_in 'staff[email]', with: @staff.email
        fill_in 'staff[password]', with: 'password'
        click_on I18n.t('views.actions.sign_in')
      end

      assert_text I18n.t('devise.sessions.signed_in')
    end
  end
end

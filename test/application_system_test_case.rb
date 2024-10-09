require "test_helper"
require 'capybara/cuprite'
require 'test_helpers/cuprite_helpers'
require 'test_helpers/cuprite_setup'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :better_cuprite

  def logging_in
    admin = users(:admin)
    visit login_url

    fill_in 'user_name', with: admin.name
    fill_in 'user_password', with: admin.password_hash
    click_on 'Anmelden'
  end
end

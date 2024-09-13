require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test 'creating message works' do
    visit root_url

    fill_in "Name *", with: "It's me"
    fill_in "Email *", with: 'me@example.com'
    fill_in 'Nachricht *', with: 'This is but a test message'
    click_on 'Absenden'

    take_screenshot
    assert_content "Erfolgreich abgeschickt"

    msg = Message.last
    assert_equal 'me@example.com', msg.email
  end
end

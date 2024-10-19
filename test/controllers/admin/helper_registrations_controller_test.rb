require "test_helper"

class Admin::HelperRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_helper_registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_helper_registrations_update_url
    assert_response :success
  end
end

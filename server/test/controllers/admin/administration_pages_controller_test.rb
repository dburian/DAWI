require 'test_helper'

class Admin::AdministrationPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_administration_pages_home_url
    assert_response :success
  end

end

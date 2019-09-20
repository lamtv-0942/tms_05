require "test_helper"

class Admin::SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_subjects_new_url
    assert_response :success
  end
end

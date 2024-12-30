require "test_helper"

class CvsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cvs_new_url
    assert_response :success
  end

  test "should get create" do
    get cvs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cvs_destroy_url
    assert_response :success
  end
end

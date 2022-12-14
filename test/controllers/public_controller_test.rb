require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_index_url
    assert_response :success
  end
end

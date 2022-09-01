require "test_helper"

class WishitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wishitems_index_url
    assert_response :success
  end

  test "should get show" do
    get wishitems_show_url
    assert_response :success
  end

  test "should get new" do
    get wishitems_new_url
    assert_response :success
  end

  test "should get edit" do
    get wishitems_edit_url
    assert_response :success
  end
end

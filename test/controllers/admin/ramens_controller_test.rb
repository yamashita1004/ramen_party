require "test_helper"

class Admin::RamensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ramens_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_ramens_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ramens_edit_url
    assert_response :success
  end
end

require "test_helper"

class Public::RamensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_ramens_new_url
    assert_response :success
  end

  test "should get index" do
    get public_ramens_index_url
    assert_response :success
  end

  test "should get show" do
    get public_ramens_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_ramens_edit_url
    assert_response :success
  end
end

require 'test_helper'

class AttendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendings_index_url
    assert_response :success
  end

  test "should get new" do
    get attendings_new_url
    assert_response :success
  end

  test "should get show" do
    get attendings_show_url
    assert_response :success
  end

  test "should get edit" do
    get attendings_edit_url
    assert_response :success
  end

end

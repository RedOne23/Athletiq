require 'test_helper'

class FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facilities_index_url
    assert_response :success
  end

  test "should get show" do
    get facilities_show_url
    assert_response :success
  end

  test "should get new" do
    get facilities_new_url
    assert_response :success
  end

  test "should get create" do
    get facilities_create_url
    assert_response :success
  end

end

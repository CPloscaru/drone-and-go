require "test_helper"

class DronesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drones_new_url
    assert_response :success
  end

  test "should get show" do
    get drones_show_url
    assert_response :success
  end

  test "should get index" do
    get drones_index_url
    assert_response :success
  end
end

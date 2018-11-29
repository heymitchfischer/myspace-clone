require 'test_helper'

class FriendRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friend_request_index_url
    assert_response :success
  end

  test "should get create" do
    get friend_request_create_url
    assert_response :success
  end

  test "should get destroy" do
    get friend_request_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class DeliveryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get deliver" do
    get :deliver
    assert_response :success
  end

  test "should get next" do
    get :next
    assert_response :success
  end

end

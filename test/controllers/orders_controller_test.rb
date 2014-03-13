require 'test_helper'

class OrdersControllerTest < ActiveSupport::TestCase
  test "should get index" do 
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end
end

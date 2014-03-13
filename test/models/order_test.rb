require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save order without start_time" do 
    order = Order.new
    assert !order.save, "Saved the order without a start_time" 
  end
end

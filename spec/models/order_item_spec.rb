require 'spec_helper'

describe OrderItem do
  describe "when amount is not present" do
    subject { @order_item }   

    before do
      @order_item = OrderItem.new(amount: nil)
    end

    it { should_not be_valid }
  end 
end
require 'spec_helper'

describe Order do
  before { @order = Order.new(start_time: "2014-3-11 8:29:59", end_time: "2014-3-11 8:30:00", difftime: 1, time_cost: 4) }

  subject { @order }

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:difftime) }
  it { should respond_to(:time_cost) }

  it { should be_valid}

  describe "when difftime is less than 0" do
    before { @order.difftime = -1 }

    it { should_not be_valid }
    
  end

  describe "some testing examples" do
    before { visit orders_path }
     
    
  end
end

require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :start_time => "Start Time",
      :end_time => "End Time",
      :difftime => 1,
      :cost => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Start Time/)
    rendered.should match(/End Time/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end

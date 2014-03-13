require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :start_time => "MyString",
      :end_time => "MyString",
      :difftime => 1,
      :cost => 1
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_start_time[name=?]", "order[start_time]"
      assert_select "input#order_end_time[name=?]", "order[end_time]"
      assert_select "input#order_difftime[name=?]", "order[difftime]"
      assert_select "input#order_cost[name=?]", "order[cost]"
    end
  end
end

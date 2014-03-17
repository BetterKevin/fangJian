require 'spec_helper'

describe "Orders" do
  before { @order = Order.create }
  subject { page }

  describe "Edit Page" do
    before { visit edit_order_path(@order) }
    it { should have_content("编辑账单") }
  end
end

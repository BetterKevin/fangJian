require 'spec_helper'

describe "Orders" do
  subject { page }

  describe "Edit Page" do
    before do
      @order = Order.create
      visit edit_order_path(@order)
    end

    it { should have_content("编辑开始时间") }
  end

end

require 'spec_helper'

describe "Orders" do
  describe "Add_item Page" do
    let(:order) { FactoryGirl.create(:order) }
    subject { page }
    before { visit add_item_order_path(order) }

    it { should have_title("坊间｜点餐") }

    describe "with invalid information" do
      before do 
        fill_in "数量", with: 1
      end

      it "should not create a order item" do
        expect { click_button "创建" }.not_to change(OrderItem, :count).by(1)
      end
    end
  end
end

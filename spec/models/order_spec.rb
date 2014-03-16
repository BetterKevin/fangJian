require 'spec_helper'
require 'pry'

describe Order do

  subject { @order = Order.new }

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:time_cost) }
  it { should respond_to(:product_cost) }
  it { should respond_to(:total_cost) }

  it { should be_valid}

  describe "#time_price" do # time_price is a instance method
    context "weekdays" do
      context "between 8:30 to 18:00" do
        it "should return correct price" do
          order = Order.new(start_time: "2014-03-13 9:00:00", end_time: "2014-03-13 12:00:00")
          expect(order.time_price).to eq(10)
        end
      end
    end

    context "weekdays" do
      context "after 18:00" do
        it "should return correct price" do
          order = Order.new(start_time: "2014-3-14 18:00:00", end_time: "2014-3-14 22:00:00")
          expect(order.time_price).to eq(15)
        end
      end
    end

    context "weekend" do
      context "between 8:30 and 18:00" do
        it "should return correct price" do
          order = Order.new(start_time: "2014-3-15 8:30:00", end_time: "2014-3-15 12:00:00")
          expect(order.time_price).to eq(13)
        end
      end
    end

    context "weekend" do
      context "after 18:00" do
        it "should return correct price" do
          order = Order.new(start_time: "2014-3-16 18:00:00", end_time: "2014-3-16 22:00:00")
          expect(order.time_price).to eq(17)
        end
      end
    end

    context "weekend" do
      context "at 17:59:59" do
        it "should return correct price" do
          order = Order.new(start_time: "2014-3-14 17:59:59", end_time: "2014-3-14 18:59:59")
          expect(order.time_price).to eq(4)
        end
      end
    end

    context "weekend" do
      context "between 16:00 and 20:00" do
        it "should return correct price" do
          order = Order.new(start_time: "2014-3-14 16:00:00", end_time: "2014-3-14 20:00:00")
          expect(order.time_price).to eq(13)
        end
      end
    end
  end

  describe "#diff_time" do
    context "the minutes" do
      context "between 2014-03-13 23:50:59 and 2014-03-14 00:00:00"
      it "should return correct difftime" do
        order = Order.new(start_time: "2014-03-13 23:50:59", end_time: "2014-03-14 00:00:00")
        expect(order.diff_time). to eq(9)
      end
    end
  end

  describe "#products_price" do
    context "5份6元车仔面, 30元" do
      it "should return correct price" do
        order = Order.create
        product = Product.create(name: "车仔面", price: 6) 
        order_item = OrderItem.create(amount: 5, order_id: order.id, product_id: product.id)
        expect(order.products_price).to eq(30)
      end
    end
  end

  describe "the total cost" do
    context "weedays" do
      context "after 18:00" do
        context "一份车仔面" do
          it "should return correct price" do
            order = Order.create(start_time: "2014-3-14 18:00:00", end_time: "2014-3-14 22:00:00")
            product = Product.create(name: "车仔面", price: 6) 
            order_item = OrderItem.create(amount: 1, order_id: order.id, product_id: product.id)
            expect(order.products_price + order.time_price).to eq(21)
          end
        end
      end
    end
  end

  describe "the total cost" do
    context "weedays" do
      context "after 18:00" do
        context "五份车仔面" do
          it "should return correct price" do
            order = Order.create(start_time: "2014-3-14 18:00:00", end_time: "2014-3-14 22:00:00")
            product = Product.create(name: "车仔面", price: 6) 
            order_item = OrderItem.create(amount: 5, order_id: order.id, product_id: product.id)
            expect(order.products_price + order.time_price).to eq(45)
          end
        end
      end
    end
  end

  describe "the total cost" do
    context "weedays" do
      context "after 18:00" do
        context "五份车仔面,三份乌冬面" do
          it "should return correct price" do
            order = Order.create(start_time: "2014-3-14 18:00:00", end_time: "2014-3-14 22:00:00")
            product = Product.create(name: "车仔面", price: 6) 
            product2 = Product.create(name: "乌冬面", price: 7)
            order_item = OrderItem.create(amount: 5, order_id: order.id, product_id: product.id)
            order_item = OrderItem.create(amount: 3, order_id: order.id, product_id: product2.id)
            expect(order.products_price + order.time_price).to eq(66)
          end
        end
      end
    end
  end

end

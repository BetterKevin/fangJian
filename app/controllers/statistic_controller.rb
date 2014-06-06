class StatisticController < ApplicationController
  def index
    @today_orders = Order.where(start_time: (Time.now.midnight..(Time.now.midnight + 1.day)))
    @jiezhang = @today_orders.where("end_time != 'nil'")
    @total_cost = @jiezhang.inject(0) { |sum, order| sum + (order.time_price + order.products_price) }
    @products = Product.all
    @num = 0
  end
end

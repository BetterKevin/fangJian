class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items 

  default_scope { order(created_at: :desc) }  

  def time_price
    difftime = diff_time # call method 'diff_time'
    stime = start_time.to_datetime
    wday   = stime.wday
    hour   = stime.hour
    minute = stime.min

    if wday == 0 || wday == 6 # weekend
      if hour >= 18 || (hour < 8) || (hour == 8 && minute < 30 ) # 18:00 - 0:00, 0:00 - 8:30
        first_hour = 8
      else
        first_hour = 6
      end
    else
      if hour >= 18 || (hour < 8) || (hour == 8 && minute < 30 ) # weekday
        first_hour = 6
      else
        first_hour = 4
      end
    end
    if difftime <= 60
      return first_hour 
    else
      time_without_the_first_hour = difftime - 60
      times_of_20_minutes = time_without_the_first_hour / 20
      return times_of_20_minutes * 1 + first_hour
    end
  end

  def diff_time
    ((DateTime.parse(end_time) - DateTime.parse(start_time)) * 24 * 60).to_i
  end

  def products_price
    self.order_items.inject(0) { |sum, item| sum + item.amount * item.product.price } 
  end
end

class Order < ActiveRecord::Base

  def self.time_price(time_difference, wday, hour, minute)

    if wday == 7 || wday == 6
      if hour >= 18 && (hour <= 8 && minute <= 30)
        if time_difference <= 60
          return 8
        else
          time_without_the_first_hour = time_difference - 60
          times_of_20_minutes = time_without_the_first_hour / 20
          return times_of_20_minutes * 1 + 8
        end
      else
        if time_difference <= 60
          return 6
        else
          time_without_the_first_hour = time_difference - 60
          times_of_20_minutes = time_without_the_first_hour / 20
          return times_of_20_minutes * 1 + 6
        end
      end
    else
      if hour >= 18 || (hour <= 8 && minute <= 30)
        if time_difference <= 60
          return 6
        else
          time_without_the_first_hour = time_difference - 60
          times_of_20_minutes = time_without_the_first_hour / 20
          return times_of_20_minutes * 1 + 6
        end
      else
        if time_difference <= 60
          return 4
        else
          time_without_the_first_hour = time_difference - 60
          times_of_20_minutes = time_without_the_first_hour / 20
          return times_of_20_minutes * 1 + 4
        end
      end
    end
    
  end

end

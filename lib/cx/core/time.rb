require 'cx/core/time_format'

class Time
  include TimeFormat

  def minute_of_day
    (hour * 60) + min
  end

  def second_of_day
    (hour * 3600) + (min * 60) + sec
  end

  def day_of_week
    to_date.wday
  end

end


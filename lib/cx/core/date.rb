require 'date'
require 'cx/core/time_format'

class Date
  include TimeFormat

  def mdy(century: true, sep: nil)
    to_time.mdy(century: century, sep: sep)
  end

  def days_between(other)
    (other - self).to_i.abs
  end

  def years_between(other)
    days_between(other).to_f / 365.25
  end

  def months_between(other)
    years_between(other) * 12
  end

  def latest(other)
    self > other ? self : other
  end

  def earliest(other)
    self < other ? self : other
  end

  def weekend?
    (d = wday) == 0 || d == 6
  end

  def day_of_week
    wday
  end

  def next_monday_if_weekend
    case wday
      when 0 then self + 1
      when 6 then self + 2
    else
      self
    end
  end

  def prev_friday_if_weekend
    case wday
      when 0 then self - 2
      when 6 then self - 1
    else
      self
    end
  end
end

class String
  def to_date
    Date.parse(self)
  end
end


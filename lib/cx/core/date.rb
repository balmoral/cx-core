require 'date'
require 'cx/core/time_format'

class Date
  include TimeFormat

  SUNDAY    = 0
  MONDAY    = 1
  TUESDAY   = 2
  WEDNESDAY = 3
  THURSDAY  = 4
  FRIDAY    = 5
  SATURDAY  = 6

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
    (d = wday) == SUNDAY || d == SATURDAY
  end

  def weekday?
    !weekend?
  end

  def day_of_week
    wday
  end

  alias_method :dow, :day_of_week

  def next_week_day(wday)
    delta = wday - self.wday
    if delta < 0
      delta = 7 + delta
    elsif delta == 0
      delta = 7
    end
    self + delta
  end

  def tomorrow
    self + 1
  end

  def yesterday
    self - 1
  end

  def next_sunday
    next_week_day(SUNDAY)
  end

  def next_monday
    next_week_day(MONDAY)
  end

  def next_tuesday
    next_week_day(TUESDAY)
  end

  def next_wednesday
    next_week_day(WEDNESDAY)
  end

  def next_thursday
    next_week_day(THURSDAY)
  end

  def next_friday
    next_week_day(FRIDAY)
  end

  def next_saturday
    next_week_day(SATURDAY)
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


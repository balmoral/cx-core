require 'date'
require 'cx/core/time_format'

class DateTime
  include TimeFormat

  # Returns a Rational (fractional) number of days
  def days_between(other)
    (other - self).abs
  end

  # Returns a Rational (fractional) number of hours
  def hours_between(other)
    (other - self).abs * 24
  end

  # Returns a Rational (fractional) number of minutes
  def minutes_between(other)
    (other - self).abs * 1440 # 24 * 60 = 1440
  end

  # Returns an integer number of seconds
  def seconds_between(other)
    ((other - self).abs * 86400).to_i  # 24 * 60 * 60 = 86400
  end

end
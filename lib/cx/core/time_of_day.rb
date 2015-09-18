class TimeOfDay
  # Returns array [hour, minute, second]
  # given an a second of the day.
  def self.to_hms(second_of_day)
    h = (second_of_day / 3600).to_i
    m = ((second_of_day - (h * 3600)) / 60).to_i
    s = second_of_day % 60
    [h, m, s]
  end
end
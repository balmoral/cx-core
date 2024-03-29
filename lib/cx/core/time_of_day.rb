class TimeOfDay
  # Returns array [hour, minute, second]
  # given an a second of the day.
  def self.hms(second_of_day)
    h = (second_of_day / 3600).to_i
    m = ((second_of_day - (h * 3600)) / 60).to_i
    s = second_of_day % 60
    [h, m, s]
  end

  # Returns the second of the day.
  # Arg may be a Time or DateTime or anything
  # which responds to :hour, :min and :sec.
  # Or args may be hour, min_of_hour, sec_of_min
  # with min and sec being optional.
  def self.second(*args)
    if args[0].respond_to?(:hour) # Time or DateTime
      h = args[0].hour
      m = args[0].min
      s = args[0].sec
    else
      h, m, s = args
    end
    (h.to_i * 3600) + (m.to_i * 60) + s.to_i
  end
end
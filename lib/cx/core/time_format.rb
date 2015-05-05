module TimeFormat
  def _fmt(fmt_s, sep)
    f = ''
    c = 0
    fmt_s.chars.each do |e|
      c += 1
      f = f + '%'
      f = f + e
      f = f + sep if sep && c < fmt_s.size
    end
    f
  end

  def ymd(century: false, sep: nil)
    strftime(_fmt century ? 'Ymd' : 'ymd', sep)
  end

  def yyyymmdd(sep: nil)
    ymd(century: true, sep: sep)
  end

  def dmy(century: false, sep: nil)
    strftime(_fmt century ? 'dmY' : 'dmy', sep)
  end

  def ddmmyyyy(sep: nil)
    dmy(century: true, sep: sep)
  end

  def mdy(century: false, sep: nil)
    strftime(_fmt century ? 'mdY' : 'mdy', sep)
  end

  def mmddyyyy(sep: nil)
      mdy(century: true, sep: sep)
    end

  def hm(sep: nil)
    strftime(_fmt 'HM', sep)
  end

  def hms(sep: nil)
    strftime(_fmt 'HMS', sep)
  end

  def hmsl(sep: nil)
    strftime(_fmt 'HMSL', sep)
  end

  def ymdhm(century: false, date_sep: nil, time_sep: nil)
    gap = date_sep || time_sep ? ' ' : ''
    "#{ymd century: century, sep: date_sep}#{gap}#{hm sep: time_sep}"
  end

  def yyyymmddhhmm(date_sep: nil, time_sep: nil)
    ymdhm(century: true, date_sep: date_sep, time_sep: time_sep)
  end

  def ymdhms(century: false, date_sep: nil, time_sep: nil)
    gap = date_sep || time_sep ? ' ' : ''
    "#{ymd century: century, sep: date_sep}#{gap}#{hms sep: time_sep}"
  end

  def yyyymmddhhmmss(date_sep: nil, time_sep: nil)
    ymdhms(century: true, date_sep: date_sep, time_sep: time_sep)
  end

  def ymdhmsl(century: false, date_sep: nil, time_sep: nil)
    gap = date_sep || time_sep ? ' ' : ''
    "#{ymd century: century, sep: date_sep}#{gap}#{hmsl sep: time_sep}"
  end

  def yyyymmddhhmmssll(date_sep: nil, time_sep: nil)
      ymdhmsl(century: true, date_sep: date_sep, time_sep: time_sep)
  end

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


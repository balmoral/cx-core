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

  def ymdhm(century: true, date_sep: nil, time_sep: nil, space: nil)
    "#{ymd century: century, sep: date_sep}#{space}#{hm sep: time_sep}"
  end

  def yymmddhhmm(date_sep: nil, time_sep: nil, space: nil)
    ymdhm(century: false, date_sep: date_sep, time_sep: time_sep, space: space)
  end

  def yyyymmddhhmm(date_sep: nil, time_sep: nil, space: nil)
    ymdhm(century: true, date_sep: date_sep, time_sep: time_sep, space: space)
  end

  def ymdhms(century: true, date_sep: nil, time_sep: nil, space: nil)
    "#{ymd century: century, sep: date_sep}#{space}#{hms sep: time_sep}"
  end

  def yymmddhhmmss(date_sep: nil, time_sep: nil, space: nil)
    ymdhms(century: false, date_sep: date_sep, time_sep: time_sep, space: space)
  end

  def yyyymmddhhmmss(date_sep: nil, time_sep: nil, space: nil)
    ymdhms(century: true, date_sep: date_sep, time_sep: time_sep, space: space)
  end

  def ymdhmsl(century: false, date_sep: nil, time_sep: nil, space: nil)
    "#{ymd century: century, sep: date_sep}#{space}#{hmsl sep: time_sep}"
  end

  def yyyymmddhhmmssll(date_sep: nil, time_sep: nil, space: nil)
      ymdhmsl(century: true, date_sep: date_sep, time_sep: time_sep, space: space)
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


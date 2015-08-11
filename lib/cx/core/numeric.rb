class Numeric
  def percent
    self * 100
  end

  def multiple?(m)
    m != 0 && self.to_int % m == 0
  end

  def even?
    to_i % 2 == 0
  end

  def odd?
    to_i % 2 == 1
  end

  def negate
    self * -1
  end

  def sqrt
    self ** 0.5
  end

  def squared
    self * self
  end

  def log2
    Math::log2(self)
  end

  def log10;
    Math::log10(self)
  end

  def log(base = nil)
    base ? Math::log(self, base) : Math::log(self)
  end

  alias ln log

  def margin(other)
    if other == 0
      self == 0 ? 0 : Float::INFINITY
    else
      (self - other) / other
    end
  end

  def sign
    if self > 0
      1
    else
      self < 0 ? -1 : 0
    end
  end

  def day_of_week
    d = to_i
    d = -d if d < 0
    d % 6
  end

  # string format

  def fmt(width = 0, prec = 0, comma: true)
    s = "%#{width}.#{prec}f" % self
    comma ? s.comma_numeric : s
  end

end

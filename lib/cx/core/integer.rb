class Integer
  def hhmmss
    h = (self / 3600).to_i
    m = ((self - (h * 3600)) / 60).to_i
    s = self % 60
    '%02d%02d%02d' % [h, m, s]
  end
end

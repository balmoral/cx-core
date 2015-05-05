class Hash
  # Returns new instance with same keys,
  # with values changed to those
  # provided by block argument.
  # Block should expect key and value
  # and return a possibly new value.
  def substitute
    result = self.class.new
    each_pair do |k,v|
      result[k] = yield(k,v)
    end
    result
  end
end


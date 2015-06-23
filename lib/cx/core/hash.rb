class Hash
  # Returns new instance with keys and values provided by given block.
  # Block should expect key and value and return an array key-value pair.
  def convert
    result = self.class.new
    each_pair do |k,v|
      new_key, new_val = yield(k, v)
      result[new_key] = new_val
    end
    result
  end
end


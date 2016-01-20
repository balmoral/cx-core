class Class
  # Returns a string got from final section
  # (after the last ::) of the given class name.
  # If no :: found the full name is returned
  def moniker
    unless @moniker
      n = name
      m = n.match(/::(\w*)$/)
      @moniker = m ? m[1] : n
    end
    @moniker
  end

  # Returns array of classes which inherit from the receiver.
  def descendants
    ObjectSpace.each_object(singleton_class).select { |klass| klass < self }
  end
end

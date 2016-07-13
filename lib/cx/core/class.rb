class Class
  # Returns array of classes which inherit from the receiver.
  def descendants
    ObjectSpace.each_object(singleton_class).select { |klass| klass < self }
  end
end

class Object
  # Set all instance variables to nil.
  # Purpose is to assist garbage collection be breaking references
  # (especially circular ones).
  def set_instance_variables_to_nil
    instance_variables.each { |v| instance_variable_set(v, nil) }
  end

  # Returns a symbol got from final section
  # (after the last ::) of the given class name.
  # If no :: found the full name is returned
  def class_tag
    self.class.tag
  end
end



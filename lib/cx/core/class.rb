class Class
    # Returns a symbol got from final section
  # (after the last ::) of the given class name.
  # If no :: found the full name is returned
  def tag
    unless @tag
      n = name
      m = n.match(/::(\w*)$/)
      @tag = (m ? m[1] : n).to_sym
    end
    @tag
  end
end

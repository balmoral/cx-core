class Module
  # Returns a string got from final section
  # (after the last ::) of the module name.
  # If no :: found the full name is returned
  def moniker
    unless @moniker
      n = name
      m = n.match(/::(\w*)$/)
      @moniker = m ? m[1] : n
    end
    @moniker
  end
end

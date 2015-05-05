
class Symbol

  # Returns symbol with trailing '=' removed.
  def to_reader
    s = to_s
    s.end_with?('=') ? s.chop.to_sym : self
  end

  # Returns symbol with '=' appended.
  # Won't add if already ends in '='.
  def to_writer
    s = to_s
    s.end_with?('=') ? self : (s + '=').to_sym
  end
end
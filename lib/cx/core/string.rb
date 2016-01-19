require 'cx/core/constants'

class String
  # Returns new string with comma separated values
  # got from args and a newline appended.
  # Args should be enumerable.
  # If one or all of args is enumerable
  # then recursively call csv for that arg.
  def self.csv(args, sep = COMMA)
    new.csv(args)
  end

  # Returns self with newline character appended.
  def nl
    self << NL
  end

  # Returns self with comma character appended.
  def comma
    self << COMMA
  end

  # Returns self with tab character appended.
  def tab
    self << TAB
  end

  # Returns string with all non-cap
  # characters removed.
  # EG 'John Smith' becomes 'JS'
  def caps_only
    gsub /[[a-z],\d,\s,[:punct:]]/, ''
  end

  # Returns camel case string from a snake case.
  # e.g. 'john_smith' to 'JohnSmith'
  # if string is already camel case it should not change
  def camel_case
    sub(/^[a-z]/){|a|a.upcase}
    .gsub(/[_\-][a-z]/) {|a| a[1].upcase }
  end

  alias_method :camelize, :camel_case

  # Takes a camel case or snake case string
  # (like a class name or method name respectively)
  # If the receiver is camel case then the result
  # inserts spaces before the caps, except for
  # the first, or when caps a sequential.
  # If the receiver is snake case then the result
  # has spaces substituted for underscores.
  # e.g. 'AbcDefGhi' => 'Abc Def Ghi'
  # e.g. 'AbcABC' => 'Abc ABC'
  def words
    gsub(/([a-z\d])([A-Z])/, '\1 \2')
    .gsub(/_/, ' ').single_space
  end

  def words_capitalize
    words.gsub(/\b(\w)/) {|w| w.upcase}
  end

  # Returns a string composed of the capitalized first characters
  # of each word in self.words.
  def acronym
    words
    .split(' ')
    .map {|w| w[0].upcase}
    .join
  end

  # Returns string 'john_smith' as 'John Smith'
  def underscore_to_upcase
    downcase
    .sub(/^\w/) {|w| w[0].upcase}
    .gsub(/_\w/) {|w| ' ' + w[1].upcase}
  end

  # Returns the snake_case (underscore) version of a CamelCase string.
  # If it is already underscore,it should return the same string.
  def snake_case
    single_space
    .gsub(/ /, '_')
    .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    .gsub(/([a-z\d])([A-Z])/, '\1_\2')
    .single_underscore
    .downcase
  end

  # Returns a CamelCase string from a spaced or underscored string.
  def camel_case
    single_space
    .gsub(/ /, '_')
    .sub(/^[a-z]/) {|a| a.upcase}
    .gsub(/[_\-][a-z]/) {|a| a[1].upcase }
  end

  # Returns string where all spaces between words are single only.
  # Leading & trailing spaces are stripped.
  def single_space
    gsub(/ {2,}/, ' ').strip
  end

  # Returns string where all underscores between words are single only.
  def single_underscore
    gsub(/_{2,}/, '_')
  end

  # Returns a string with commas added every 3 chars.
  def comma_numeric
    is_neg = self[0] == '-'
    min_len = 3 + (is_neg ? 1 : 0)
    if size <= min_len
      self
    else
      dot = index('.') || size
      if dot <= min_len
        self
      else
        first = self[0..(dot-1)]
        last = self[(dot+1)..-1]
        first = first[1..-1] if is_neg
        # fixed = first.reverse.gsub(/...(?=.)/, '\&,').reverse
        fixed = first.reverse.gsub(/...(?=.)/) {|s| "#{s},"}.reverse
        "#{is_neg ? '-' : ''}#{fixed}#{last ? '.' : ''}#{last}"
      end
    end
  end

  def strip_trailing_zeros
    strip.sub(/(\.0*[1-9]*)0*$/, '\1').sub(/\.$/,'').sub(/\.0*$/,'')
  end

end # String
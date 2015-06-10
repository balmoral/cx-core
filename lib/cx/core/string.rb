COMMA  = ','
TAB    = "\t"
NL     = "\n"
EOL    = "\n"
CR     = "\r"
DOT    = '.'
PIPE   = '|'
SLASH  = '/'
SLOSH  = '\\'
CARET  = '^'
TILDE  = '~'
AT     = '@'

class String
  # Returns new string with comma separated values
  # got from args and a newline appended.
  # Args should be enumerable.
  # If one or all of args is enumerable
  # then recursively call csv for that arg.
  def self.csv(args, sep = ',')
    new.csv(args)
  end

  # Returns self with newline character appended.
  def nl
    self << "\n"
  end

  # Returns self with comma character appended.
  def comma
    self << ','
  end

  # Returns self with tab character appended.
  def tab
    self << "\t"
  end

  # Returns string with all non-cap
  # characters removed.
  # EG 'John Smith' becomes 'JS'
  def caps_only
    gsub /[[a-z],\d,\s,[:punct:]]/, ''
  end

  # Returns camel case string
  # e.g. 'john_smith' to 'JohnSmith'
  def camel_case
    downcase.sub(/^\w/) {|s| s[0].to_s.upcase}.gsub(/_\w/) {|s| s[1].to_s.upcase}
  end

  # Returns string 'john_smith' as 'John Smith'
  def underscore_to_upcase
    downcase.sub(/^\w/) {|s| s[0].to_s.upcase}.gsub(/_\w/) {|s| ' ' + s[1].to_s.upcase}
  end

  # Returns the snake case (underscore) version of a string.
  # If it is already underscore, it should return the same string.
  def snake_case
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
  end

  # Returns a string with commas added
  # every 3 chars
  def comma_numeric
    reverse.gsub(/...(?=.)/,'\&,').reverse
  end

end # String
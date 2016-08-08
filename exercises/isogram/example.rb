class Isogram
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def check_for_isogram
    idx1 = 0
    idx2 = 1
    while idx1 < string.length
      while idx2 < string.length
        if string[idx1] == string[idx2]
          return false
        end
      idx2 += 1
      end
    idx1 += 1
    idx2 = idx1 + 1
    end
    true
  end
end

  # BELOW IS THE REFACTORED ALGORITHM USING STANDARD RUBY LIBRARY METHODS

  # def check_for_isogram
  #   original_string_length = string.length
  #   unique_chars_length = string.split("").uniq.length
  #   original_string_length == unique_chars_length ? true : false
  # end
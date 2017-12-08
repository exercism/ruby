module BookKeeping
  VERSION = 1
end

class IsbnVerifier
  def self.valid?(str)
    return false unless /\A\d-?\d{3}-?\d{5}-?[\dX]\z/.match(str)

    result = str
      .gsub("-", "")
      .chars
      .map { |char|
        char.gsub("X","10")
      }
      .zip(10.downto(1))
      .map { |number, index|
        number.to_i * index
      }
      .reduce(0){ |sum, digit|
        sum + digit
      }

    result % 11 == 0
  end
end
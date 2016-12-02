module BookKeeping
  VERSION = 3
end

class Binary
  def self.to_decimal binary
    fail ArgumentError.new("invalid binary input #{binary}") if invalid?(binary)

    digits(binary).reduce(0, &method(:convert))
  end

  private

  def self.invalid?(binary)
    binary =~ /[^01]/
  end

  def self.digits(binary)
    binary.chars.map(&:to_i)
  end

  def self.convert(decimal, digit)
    decimal * 2 + digit
  end
end

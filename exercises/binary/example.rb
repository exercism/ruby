class Binary
  VERSION = 1

  attr_reader :digits
  def initialize(s)
    fail ArgumentError.new("invalid binary input #{s}") unless valid?(s)

    @digits = s.chars.reverse.collect(&:to_i)
  end

  def to_decimal
    digits.each_with_index.inject(0) do |decimal, (digit, i)|
      decimal + digit * 2**i
    end
  end

  private

  # rubocop:disable Style/WordArray
  def valid?(s)
    s.chars.all? { |char| ['0', '1'].include?(char) }
  end
end

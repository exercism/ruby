Palindrome = Struct.new(:value, :factors)

class Palindromes
  private
  attr_reader :min, :max

  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError, "min must be <= max" unless min_factor <= max_factor

    @min = min_factor
    @max = max_factor
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def factors(palindrome)
    (min..Math.sqrt(palindrome)).each_with_object([]) do |number, factors|
      div, mod = palindrome.divmod(number)
      factors << [number, div] if div.between?(min, max) && mod.zero?
    end
  end

  def find_palindrome(enum)
    enum.lazy.
      filter { |number| palindrome? number }.
      map { |number| Palindrome.new number, factors(number) }.
      find { |palindrome| !palindrome.factors.empty? }
  end

  public
  attr_reader :smallest, :largest

  def generate
    @smallest = find_palindrome(min**2..max**2) || Palindrome.new(nil, [])

    @largest = find_palindrome((max**2..min**2).step(-1)) || Palindrome.new(nil, [])
  end
end

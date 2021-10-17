class Palindrome
  attr_reader :value, :factors
  private
  def initialize(palindrome) @value, @factors = palindrome end
end

class Palindromes

  private

  attr_reader :range, :candidates

  def initialize(min_factor: 1, max_factor: 9)
    @range = (min_factor..max_factor)
  end

  def factors(palindrome)
    range.each_with_object([]) do |number, factors|
      div, mod = palindrome.divmod(number)
      if div <= number && range.include?(div) && mod.zero?
        factors << [div, number]
      end
    end
  end

  def palindrome_and_factors(palindrome)
    [palindrome, factors(palindrome)]
  end

  public

  def generate
    @candidates ||= range.each_with_object([]) do |r1, candidates|
      (r1..range.last).each do |r2|
        candidate = r1 * r2
        if candidate == candidate.to_s.reverse.to_i
          candidates << candidate
        end
      end
    end
  end

  def largest
    @largest ||= Palindrome.new palindrome_and_factors(candidates.max)
  end

  def smallest
    @smallest ||= Palindrome.new palindrome_and_factors(candidates.min)
  end

end

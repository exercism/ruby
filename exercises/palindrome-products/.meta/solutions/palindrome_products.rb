class Palindromes

  attr_reader :min, :max, :combinations

  def initialize(min_factor: 1, max_factor: )
    @min = min_factor
    @max = max_factor
    range = (min..max)

    @combinations = []
    range.each do |i|
      range.each do |j|
        if is_palindrome?(i * j)
          @combinations << [i,j]
        end
      end
    end
  end

  def is_palindrome?(val)
    val.to_s == val.to_s.reverse
  end

  def largest
    combinations.sort_by{|combination| combination.inject(:*)}.last.inject(:*)
  end

  def smallest
    combinations.sort_by{|combination| combination.inject(:*)}.first.inject(:*)
  end
end
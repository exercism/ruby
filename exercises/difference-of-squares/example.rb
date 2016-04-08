class Squares
  VERSION = 2

  attr_reader :max
  def initialize(max)
    @max = max
  end

  def square_of_sum
    sum = 0
    (1..max).each do |i|
      sum += i
    end
    sum**2
  end

  def sum_of_squares
    sum = 0
    (1..max).each do |i|
      sum += i**2
    end
    sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

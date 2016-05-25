module BookKeeping
  VERSION = 1
end

class Year
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.leap?(number)
    Year.new(number).leap?
  end

  def leap?
    divisible_by?(400) || divisible_by?(4) && !divisible_by?(100)
  end

  def %(other)
    number % other
  end

  private

  def divisible_by?(i)
    (self % i) == 0
  end
end

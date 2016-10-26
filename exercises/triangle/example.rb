module BookKeeping
  VERSION = 1
end

class TriangleError < RuntimeError
end

class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
    if illegal?
      @sides = []
    end
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size.between?(1, 2)
  end

  def scalene?
    sides.uniq.size == 3
  end

  private

  def illegal?
    impossible_length_side? || violates_inequality?
  end

  def violates_inequality?
    a, b, c = sides
    a + b <= c || a + c <= b || b + c <= a
  end

  def impossible_length_side?
    sides.any? { |side| side <= 0 }
  end
end

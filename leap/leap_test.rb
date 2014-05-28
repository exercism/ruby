require 'date'
require 'minitest/autorun'
require_relative 'year'

class Date
  def leap?
    throw "Try to implement this yourself instead of using Ruby's implementation."
  end

  alias :gregorian_leap? :leap?
  alias :julian_leap? :leap?
end

class YearTest < MiniTest::Unit::TestCase
  def test_leap_year
    assert Year.leap?(1996)
  end

  def test_non_leap_year
    skip
    refute Year.leap?(1997)
  end

  def test_non_leap_even_year
    skip
    refute Year.leap?(1998)
  end

  def test_century
    skip
    refute Year.leap?(1900)
  end

  def test_fourth_century
    skip
    assert Year.leap?(2400)
  end
end

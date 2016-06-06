#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'leap'

# Test data version:
# 9b8b80c
class Date
  def leap?
    throw "Implement this yourself instead of using Ruby's implementation."
  end

  alias gregorian_leap? leap?
  alias julian_leap? leap?
end

class YearTest < Minitest::Test
  def test_leap_year
    assert Year.leap?(1996), "Expected 'true', 1996 is a leap year."
  end

  def test_standard_and_odd_year
    skip
    refute Year.leap?(1997), "Expected 'false', 1997 is not a leap year."
  end

  def test_standard_even_year
    skip
    refute Year.leap?(1998), "Expected 'false', 1998 is not a leap year."
  end

  def test_standard_nineteenth_century
    skip
    refute Year.leap?(1900), "Expected 'false', 1900 is not a leap year."
  end

  def test_standard_eighteenth_century
    skip
    refute Year.leap?(1800), "Expected 'false', 1800 is not a leap year."
  end

  def test_leap_twenty_fourth_century
    skip
    assert Year.leap?(2400), "Expected 'true', 2400 is a leap year."
  end

  def test_leap_y2k
    skip
    assert Year.leap?(2000), "Expected 'true', 2000 is a leap year."
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 2, BookKeeping::VERSION
  end
end

#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'leap'

# Test data version:
# 463e543 Corrected typo

class Date
  def leap?
    throw "Implement this yourself instead of using Ruby's implementation."
  end

  alias_method :gregorian_leap?, :leap?
  alias_method :julian_leap?, :leap?
end

class YearTest < Minitest::Test
  def test_leap_year
    assert_equal 'Yes, 1996 is a leap year', Year.leap?(1996)
  end

  def test_non_leap_year
    skip
    assert_equal 'No, 1997 is not a leap year', Year.leap?(1997)
  end

  def test_non_leap_even_year
    skip
    assert_equal 'No, 1998 is not a leap year', Year.leap?(1998)
  end

  def test_century
    skip
    assert_equal 'No, 1900 is not a leap year', Year.leap?(1900)
  end

  def test_fourth_century
    skip
    assert_equal 'Yes, 2400 is a leap year', Year.leap?(2400)
  end

  def test_y2k
    skip
    assert_equal 'Yes, 2000 is a leap year', Year.leap?(2000)
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of Leap.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 1, Year::VERSION
  end
end

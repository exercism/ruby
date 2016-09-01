#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'alphametics'

# Test data version:
# 08a0cda
class AlphameticsTest < Minitest::Test
  def test_solve_short_puzzle
    # skip
    expect = {
      'I' => 1, 'B' => 9, 'L' => 0
    }
    actual = Alphametics.new.solve('I + BB == ILL')
    assert_equal(expect, actual)
  end

  def test_solve_long_puzzle
    skip
    expect = {
      'S' => 9, 'E' => 5, 'N' => 6, 'D' => 7,
      'M' => 1, 'O' => 0, 'R' => 8, 'Y' => 2
    }
    actual = Alphametics.new.solve('SEND + MORE == MONEY')
    assert_equal(expect, actual)
  end

  def test_solve_puzzle_with_multiplication
    skip
    expect = {
      'I' => 8, 'F' => 2, 'D' => 3, 'R' => 9,
      'O' => 1
    }
    actual = Alphametics.new.solve('IF * DR == DORI')
    assert_equal(expect, actual)
  end

  def test_solve_puzzle_with_exponents
    skip
    expect = {
      'P' => 9, 'I' => 6, 'R' => 7, 'A' => 4,
      'E' => 0
    }
    actual = Alphametics.new.solve('PI * R ^ 2 == AREA')
    assert_equal(expect, actual)
  end

  def test_solution_must_have_unique_value_for_each_letter
    skip
    expect = nil
    actual = Alphametics.new.solve('A == B')
    assert_equal(expect, actual)
  end

  def test_leading_zero_solution_is_invalid
    skip
    expect = nil
    actual = Alphametics.new.solve('ACA + DD == BD')
    assert_equal(expect, actual)
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
    assert_equal 3, BookKeeping::VERSION
  end
end

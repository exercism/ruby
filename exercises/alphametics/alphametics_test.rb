#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'alphametics'

# Test data version:
# 8d8589f
class AlphameticsTest < Minitest::Test
  def test_solve_short_puzzle
    # skip
    expect = {
      'I' => 1, 'B' => 9, 'L' => 0
    }
    actual = Alphametics.new.solve('I + BB == ILL')
    assert_equal(expect, actual)
  end

  # This test has been commented out due its long runtime.
  # def test_solve_long_puzzle
  #   skip
  #   expect = {
  #     'S' => 9, 'E' => 5, 'N' => 6, 'D' => 7,
  #     'M' => 1, 'O' => 0, 'R' => 8, 'Y' => 2
  #   }
  #   actual = Alphametics.new.solve('SEND + MORE == MONEY')
  #   assert_equal(expect, actual)
  # end

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

  def test_solve_puzzle_with_four_words
    skip
    expect = {
      'E' => 4, 'G' => 2, 'H' => 5, 'I' => 0,
      'L' => 1, 'S' => 9, 'T' => 7
    }
    actual = Alphametics.new.solve('HE + SEES + THE == LIGHT')
    assert_equal(expect, actual)
  end

  # This test has been commented out due its long runtime.
  # def test_solve_puzzle_with_many_words
  #   skip
  #   expect = {
  #     'A' => 5, 'D' => 3, 'E' => 4, 'F' => 7,
  #     'G' => 8, 'N' => 0, 'O' => 2, 'R' => 1,
  #     'S' => 6, 'T' => 9
  #   }
  #   actual = Alphametics.new.solve('AND + A + STRONG + OFFENSE + AS + A + GOOD = DEFENSE')
  #   assert_equal(expect, actual)
  # end

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

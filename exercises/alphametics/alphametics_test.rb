#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'alphametics'

# Common test data version: 1.0.0 b9bada8
class AlphameticsTest < Minitest::Test

  def test_puzzle_with_three_letters
    # skip
    input = 'I + BB == ILL'
    expected = { 'B' => 9, 'I' => 1, 'L' => 0 }
    assert_equal expected, Alphametics.solve(input)
  end

  def test_solution_must_have_unique_value_for_each_letter
    skip
    input = 'A == B'
    expected = {}
    assert_equal expected, Alphametics.solve(input)
  end

  def test_leading_zero_solution_is_invalid
    skip
    input = 'ACA + DD == BD'
    expected = {}
    assert_equal expected, Alphametics.solve(input)
  end

  def test_puzzle_with_four_letters
    skip
    input = 'AS + A == MOM'
    expected = { 'A' => 9, 'M' => 1, 'O' => 0, 'S' => 2 }
    assert_equal expected, Alphametics.solve(input)
  end

  def test_puzzle_with_six_letters
    skip
    input = 'NO + NO + TOO == LATE'
    expected = { 'A' => 0, 'E' => 2, 'L' => 1, 'N' => 7,
                 'O' => 4, 'T' => 9 }
    assert_equal expected, Alphametics.solve(input)
  end

  def test_puzzle_with_seven_letters
    skip
    input = 'HE + SEES + THE == LIGHT'
    expected = { 'E' => 4, 'G' => 2, 'H' => 5, 'I' => 0,
                 'L' => 1, 'S' => 9, 'T' => 7 }
    assert_equal expected, Alphametics.solve(input)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  def test_puzzle_with_eight_letters
    skip
    input = 'SEND + MORE == MONEY'
    expected = { 'D' => 7, 'E' => 5, 'M' => 1, 'N' => 6,
                 'O' => 0, 'R' => 8, 'S' => 9, 'Y' => 2 }
    assert_equal expected, Alphametics.solve(input)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  def test_puzzle_with_ten_letters
    skip
    input = 'AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE'
    expected = { 'A' => 5, 'D' => 3, 'E' => 4, 'F' => 7,
                 'G' => 8, 'N' => 0, 'O' => 2, 'R' => 1,
                 'S' => 6, 'T' => 9 }
    assert_equal expected, Alphametics.solve(input)
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
    assert_equal 4, BookKeeping::VERSION
  end
end

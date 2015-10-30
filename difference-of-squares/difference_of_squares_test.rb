#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'difference_of_squares'

# Test data version:
# 6080f94 Added difference-of-squares.json test definition

class DifferenceOfSquaresTest < Minitest::Test
  def test_square_of_sums_to_5
    assert_equal 225, Squares.new(5).square_of_sums
  end

  def test_sum_of_squares_to_5
    skip
    assert_equal 55, Squares.new(5).sum_of_squares
  end

  def test_difference_of_sums_to_5
    skip
    assert_equal 170, Squares.new(5).difference
  end

  def test_square_of_sums_to_10
    skip
    assert_equal 3_025, Squares.new(10).square_of_sums
  end

  def test_sum_of_squares_to_10
    skip
    assert_equal 385, Squares.new(10).sum_of_squares
  end

  def test_difference_of_sums_to_10
    skip
    assert_equal 2_640, Squares.new(10).difference
  end

  def test_square_of_sums_to_100
    skip
    assert_equal 25_502_500, Squares.new(100).square_of_sums
  end

  def test_sum_of_squares_to_100
    skip
    assert_equal 338_350, Squares.new(100).sum_of_squares
  end

  def test_difference_of_sums_to_100
    skip
    assert_equal 25_164_150, Squares.new(100).difference
  end

  def test_consistent_difference
    skip
    squares = Squares.new(10)
    assert_equal squares.difference, squares.difference
  end

  # Do non't foget to define a constant VERSION inside of Squares.
  def test_bookkeeping
    skip
    assert_equal 1, Squares::VERSION
  end
end

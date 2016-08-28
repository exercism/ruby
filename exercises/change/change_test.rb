#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'change'

# Test data version:
# 08a0cda
class ChangeTest < Minitest::Test
  def test_single_coin_change
    
    input = [1, 5, 10, 25, 100]
    coins = 25
    expected = [25]
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_multiple_coin_change
    
    input = [1, 5, 10, 25, 100]
    coins = 15
    expected = [5, 10]
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_change_with_Lilliputian_Coins
    
    input = [1, 4, 15, 20, 50]
    coins = 23
    expected = [4, 4, 15]
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_change_with_Lower_Elbonia_Coins
    
    input = [1, 5, 10, 21, 25]
    coins = 63
    expected = [21, 21, 21]
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_large_target_values
    
    input = [1, 2, 5, 10, 20, 50, 100]
    coins = 999
    expected = [2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100]
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_no_coins_make_0_change
    
    input = [1, 5, 10, 21, 25]
    coins = 0
    expected = []
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_error_testing_for_change_smaller_than_the_smallest_of_coins
    
    input = [5, 10]
    coins = 3
    expected = -1
    assert_equal(Change.generate(input, coins), expected)
  end

  def test_cannot_find_negative_change_values
    
    input = [1, 2, 5]
    coins = -5
    expected = -1
    assert_equal(Change.generate(input, coins), expected)
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

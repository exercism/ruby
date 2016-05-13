gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'change'

class ChangeTest < Minitest::Test

  def test_single_coin_change
    change = Change.new([1, 5, 10, 25, 100], 25)
    assert_equal [25], change.find_fewest_coins
  end

  def test_multiple_coin_change
    change = Change.new([1, 5, 10, 25, 100], 15)
    assert_equal [5, 10], change.find_fewest_coins
  end

  def test_change_with_lilliputian_coins
    change = Change.new([1, 4, 15, 20, 50], 23)
    assert_equal [4, 4, 15], change.find_fewest_coins
  end

  def test_change_with_lower_elbonia_coins
    change = Change.new([1, 5, 10, 21, 25], 63)
    assert_equal [21, 21, 21], change.find_fewest_coins
  end

  def test_large_target_values
    change = Change.new([1, 2, 5, 10, 20, 50, 100], 999)
    assert_equal [2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100], change.find_fewest_coins
  end

  def test_no_coins_make_0_change
    change = Change.new([1, 5, 10, 21, 25], 0)
    assert_equal [], change.find_fewest_coins
  end

  def test_error_testing_for_change_smaller_than_the_smallest_coins
    change = Change.new([5, 10], 3)
    assert_equal -1, change.find_fewest_coins
  end

  def test_cannot_find_negative_change_values
    change = Change.new([1, 2, 5], -5)
    assert_equal -1, change.find_fewest_coins
  end
end

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'change'

class ChangeTest < Minitest::Test

  def test_single_coin_change
    change = Change.new([1, 5, 10, 25, 100], 25)
    assert_equal [25], change.find_fewest_coins
  end

  def test_single_coin_change
    change = Change.new([1, 5, 10, 25, 100], 25)
    assert_equal [25], change.find_fewest_coins
  end
end

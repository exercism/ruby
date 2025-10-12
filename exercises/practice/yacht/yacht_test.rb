require 'minitest/autorun'
require_relative 'yacht'

class YachtTest < Minitest::Test
  def test_yacht
    # skip
    actual = Yacht.new([5, 5, 5, 5, 5], 'yacht').score
    expected = 50
    assert_equal expected, actual
  end

  def test_not_yacht
    skip
    actual = Yacht.new([1, 3, 3, 2, 5], 'yacht').score
    expected = 0
    assert_equal expected, actual
  end

  def test_ones
    skip
    actual = Yacht.new([1, 1, 1, 3, 5], 'ones').score
    expected = 3
    assert_equal expected, actual
  end

  def test_ones_out_of_order
    skip
    actual = Yacht.new([3, 1, 1, 5, 1], 'ones').score
    expected = 3
    assert_equal expected, actual
  end

  def test_no_ones
    skip
    actual = Yacht.new([4, 3, 6, 5, 5], 'ones').score
    expected = 0
    assert_equal expected, actual
  end

  def test_twos
    skip
    actual = Yacht.new([2, 3, 4, 5, 6], 'twos').score
    expected = 2
    assert_equal expected, actual
  end

  def test_fours
    skip
    actual = Yacht.new([1, 4, 1, 4, 1], 'fours').score
    expected = 8
    assert_equal expected, actual
  end

  def test_yacht_counted_as_threes
    skip
    actual = Yacht.new([3, 3, 3, 3, 3], 'threes').score
    expected = 15
    assert_equal expected, actual
  end

  def test_yacht_of_3s_counted_as_fives
    skip
    actual = Yacht.new([3, 3, 3, 3, 3], 'fives').score
    expected = 0
    assert_equal expected, actual
  end

  def test_fives
    skip
    actual = Yacht.new([1, 5, 3, 5, 3], 'fives').score
    expected = 10
    assert_equal expected, actual
  end

  def test_sixes
    skip
    actual = Yacht.new([2, 3, 4, 5, 6], 'sixes').score
    expected = 6
    assert_equal expected, actual
  end

  def test_full_house_two_small_three_big
    skip
    actual = Yacht.new([2, 2, 4, 4, 4], 'full house').score
    expected = 16
    assert_equal expected, actual
  end

  def test_full_house_three_small_two_big
    skip
    actual = Yacht.new([5, 3, 3, 5, 3], 'full house').score
    expected = 19
    assert_equal expected, actual
  end

  def test_two_pair_is_not_a_full_house
    skip
    actual = Yacht.new([2, 2, 4, 4, 5], 'full house').score
    expected = 0
    assert_equal expected, actual
  end

  def test_four_of_a_kind_is_not_a_full_house
    skip
    actual = Yacht.new([1, 4, 4, 4, 4], 'full house').score
    expected = 0
    assert_equal expected, actual
  end

  def test_yacht_is_not_a_full_house
    skip
    actual = Yacht.new([2, 2, 2, 2, 2], 'full house').score
    expected = 0
    assert_equal expected, actual
  end

  def test_four_of_a_kind
    skip
    actual = Yacht.new([6, 6, 4, 6, 6], 'four of a kind').score
    expected = 24
    assert_equal expected, actual
  end

  def test_yacht_can_be_scored_as_four_of_a_kind
    skip
    actual = Yacht.new([3, 3, 3, 3, 3], 'four of a kind').score
    expected = 12
    assert_equal expected, actual
  end

  def test_full_house_is_not_four_of_a_kind
    skip
    actual = Yacht.new([3, 3, 3, 5, 5], 'four of a kind').score
    expected = 0
    assert_equal expected, actual
  end

  def test_little_straight
    skip
    actual = Yacht.new([3, 5, 4, 1, 2], 'little straight').score
    expected = 30
    assert_equal expected, actual
  end

  def test_little_straight_as_big_straight
    skip
    actual = Yacht.new([1, 2, 3, 4, 5], 'big straight').score
    expected = 0
    assert_equal expected, actual
  end

  def test_four_in_order_but_not_a_little_straight
    skip
    actual = Yacht.new([1, 1, 2, 3, 4], 'little straight').score
    expected = 0
    assert_equal expected, actual
  end

  def test_no_pairs_but_not_a_little_straight
    skip
    actual = Yacht.new([1, 2, 3, 4, 6], 'little straight').score
    expected = 0
    assert_equal expected, actual
  end

  def test_minimum_is_1_maximum_is_5_but_not_a_little_straight
    skip
    actual = Yacht.new([1, 1, 3, 4, 5], 'little straight').score
    expected = 0
    assert_equal expected, actual
  end

  def test_big_straight
    skip
    actual = Yacht.new([4, 6, 2, 5, 3], 'big straight').score
    expected = 30
    assert_equal expected, actual
  end

  def test_big_straight_as_little_straight
    skip
    actual = Yacht.new([6, 5, 4, 3, 2], 'little straight').score
    expected = 0
    assert_equal expected, actual
  end

  def test_no_pairs_but_not_a_big_straight
    skip
    actual = Yacht.new([6, 5, 4, 3, 1], 'big straight').score
    expected = 0
    assert_equal expected, actual
  end

  def test_choice
    skip
    actual = Yacht.new([3, 3, 5, 6, 6], 'choice').score
    expected = 23
    assert_equal expected, actual
  end

  def test_yacht_as_choice
    skip
    actual = Yacht.new([2, 2, 2, 2, 2], 'choice').score
    expected = 10
    assert_equal expected, actual
  end
end

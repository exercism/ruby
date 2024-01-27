require 'minitest/autorun'
require_relative 'yacht'

class YachtTest < Minitest::Test
  def test_yacht
    # skip
    score = Yacht.new([5, 5, 5, 5, 5], 'yacht').score
    expected = 50
    assert_equal expected, score
  end

  def test_not_yacht
    skip
    score = Yacht.new([1, 3, 3, 2, 5], 'yacht').score
    expected = 0
    assert_equal expected, score
  end

  def test_ones
    skip
    score = Yacht.new([1, 1, 1, 3, 5], 'ones').score
    expected = 3
    assert_equal expected, score
  end

  def test_ones_out_of_order
    skip
    score = Yacht.new([3, 1, 1, 5, 1], 'ones').score
    expected = 3
    assert_equal expected, score
  end

  def test_no_ones
    skip
    score = Yacht.new([4, 3, 6, 5, 5], 'ones').score
    expected = 0
    assert_equal expected, score
  end

  def test_twos
    skip
    score = Yacht.new([2, 3, 4, 5, 6], 'twos').score
    expected = 2
    assert_equal expected, score
  end

  def test_fours
    skip
    score = Yacht.new([1, 4, 1, 4, 1], 'fours').score
    expected = 8
    assert_equal expected, score
  end

  def test_yacht_as_threes
    skip
    score = Yacht.new([3, 3, 3, 3, 3], 'threes').score
    expected = 15
    assert_equal expected, score
  end

  def test_yacht_of_threes_as_fives
    skip
    score = Yacht.new([3, 3, 3, 3, 3], 'fives').score
    expected = 0
    assert_equal expected, score
  end

  def test_sixes
    skip
    score = Yacht.new([2, 3, 4, 5, 6], 'sixes').score
    expected = 6
    assert_equal expected, score
  end

  def test_full_house_two_small_three_big
    skip
    score = Yacht.new([2, 2, 4, 4, 4], 'full house').score
    expected = 16
    assert_equal expected, score
  end

  def test_full_house_three_small_two_big
    skip
    score = Yacht.new([5, 3, 3, 5, 3], 'full house').score
    expected = 19
    assert_equal expected, score
  end

  def test_two_pair_not_full_house
    skip
    score = Yacht.new([2, 2, 4, 4, 5], 'full house').score
    expected = 0
    assert_equal expected, score
  end

  def test_four_of_a_kind_not_full_house
    skip
    score = Yacht.new([1, 4, 4, 4, 4], 'full house').score
    expected = 0
    assert_equal expected, score
  end

  def test_yacht_not_full_house
    skip
    score = Yacht.new([2, 2, 2, 2, 2], 'full house').score
    expected = 0
    assert_equal expected, score
  end

  def test_four_of_a_kind
    skip
    score = Yacht.new([6, 6, 4, 6, 6], 'four of a kind').score
    expected = 24
    assert_equal expected, score
  end

  def test_yacht_as_four_of_a_kind
    skip
    score = Yacht.new([3, 3, 3, 3, 3], 'four of a kind').score
    expected = 12
    assert_equal expected, score
  end

  def test_full_house_not_four_of_a_kind
    skip
    score = Yacht.new([3, 3, 3, 5, 5], 'four of a kind').score
    expected = 0
    assert_equal expected, score
  end

  def test_little_straight
    skip
    score = Yacht.new([3, 5, 4, 1, 2], 'little straight').score
    expected = 30
    assert_equal expected, score
  end

  def test_little_straight_not_big_straight
    skip
    score = Yacht.new([1, 2, 3, 4, 5], 'big straight').score
    expected = 0
    assert_equal expected, score
  end

  def test_ordered_but_not_little_straight
    skip
    score = Yacht.new([1, 1, 2, 3, 4], 'little straight').score
    expected = 0
    assert_equal expected, score
  end

  def test_no_pairs_but_not_little_straight
    skip
    score = Yacht.new([1, 2, 3, 4, 6], 'little straight').score
    expected = 0
    assert_equal expected, score
  end

  def test_min_and_max_do_not_make_little_straight
    skip
    score = Yacht.new([1, 1, 3, 4, 5], 'little straight').score
    expected = 0
    assert_equal expected, score
  end

  def test_big_straight
    skip
    score = Yacht.new([4, 6, 2, 5, 3], 'big straight').score
    expected = 30
    assert_equal expected, score
  end

  def test_big_straight_as_little_straight
    skip
    score = Yacht.new([6, 5, 4, 3, 2], 'little straight').score
    expected = 0
    assert_equal expected, score
  end

  def test_no_pairs_but_not_big_straight
    skip
    score = Yacht.new([6, 5, 4, 3, 1], 'big straight').score
    expected = 0
    assert_equal expected, score
  end

  def test_choice
    skip
    score = Yacht.new([3, 3, 5, 6, 6], 'choice').score
    expected = 23
    assert_equal expected, score
  end

  def test_yacht_as_choice
    skip
    score = Yacht.new([2, 2, 2, 2, 2], 'choice').score
    expected = 10
    assert_equal expected, score
  end
end

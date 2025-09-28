require 'minitest/autorun'
require_relative 'pythagorean_triplet'

class PythagoreanTripletTest < Minitest::Test
  def test_triplets_whose_sum_is_12
    # skip
    actual = PythagoreanTriplet.triplets_with_sum(12)
    expected = [[3, 4, 5]]
    assert_equal expected, actual
  end

  def test_triplets_whose_sum_is_108
    skip
    actual = PythagoreanTriplet.triplets_with_sum(108)
    expected = [[27, 36, 45]]
    assert_equal expected, actual
  end

  def test_triplets_whose_sum_is_1000
    skip
    actual = PythagoreanTriplet.triplets_with_sum(1000)
    expected = [[200, 375, 425]]
    assert_equal expected, actual
  end

  def test_no_matching_triplets_for_1001
    skip
    actual = PythagoreanTriplet.triplets_with_sum(1001)
    expected = []
    assert_equal expected, actual
  end

  def test_returns_all_matching_triplets
    skip
    actual = PythagoreanTriplet.triplets_with_sum(90)
    expected = [[9, 40, 41], [15, 36, 39]]
    assert_equal expected, actual
  end

  def test_several_matching_triplets
    skip
    actual = PythagoreanTriplet.triplets_with_sum(840)
    expected = [[40, 399, 401], [56, 390, 394], [105, 360, 375], [120, 350, 370], [140, 336, 364], [168, 315, 357], [210, 280, 350], [240, 252, 348]]
    assert_equal expected, actual
  end

  def test_triplets_for_large_number
    skip
    actual = PythagoreanTriplet.triplets_with_sum(30_000)
    expected = [[1200, 14_375, 14_425], [1875, 14_000, 14_125], [5000, 12_000, 13_000], [6000, 11_250, 12_750], [7500, 10_000, 12_500]]
    assert_equal expected, actual
  end
end

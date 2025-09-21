require 'minitest/autorun'
require_relative 'pascals_triangle'

class TriangleTest < Minitest::Test
  def test_zero_rows
    # skip
    actual = Triangle.new(0).rows
    expected = []
    assert_equal expected, actual
  end

  def test_single_row
    skip
    actual = Triangle.new(1).rows
    expected = [[1]]
    assert_equal expected, actual
  end

  def test_two_rows
    skip
    actual = Triangle.new(2).rows
    expected = [[1], [1, 1]]
    assert_equal expected, actual
  end

  def test_three_rows
    skip
    actual = Triangle.new(3).rows
    expected = [[1], [1, 1], [1, 2, 1]]
    assert_equal expected, actual
  end

  def test_four_rows
    skip
    actual = Triangle.new(4).rows
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
    assert_equal expected, actual
  end

  def test_five_rows
    skip
    actual = Triangle.new(5).rows
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    assert_equal expected, actual
  end

  def test_six_rows
    skip
    actual = Triangle.new(6).rows
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]
    assert_equal expected, actual
  end

  def test_ten_rows
    skip
    actual = Triangle.new(10).rows
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]]
    assert_equal expected, actual
  end
end

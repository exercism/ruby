require 'minitest/autorun'
require_relative 'pascals_triangle'

class PascalsTriangleTest < Minitest::Test
  def test_zero_rows
    # skip
    triangle = Triangle.new(0)
    expected = []
    assert_equal expected, triangle.rows
  end

  def test_single_row
    skip
    triangle = Triangle.new(1)
    expected = [[1]]
    assert_equal expected, triangle.rows
  end

  def test_two_rows
    skip
    triangle = Triangle.new(2)
    expected = [[1], [1, 1]]
    assert_equal expected, triangle.rows
  end

  def test_three_rows
    skip
    triangle = Triangle.new(3)
    expected = [[1], [1, 1], [1, 2, 1]]
    assert_equal expected, triangle.rows
  end

  def test_four_rows
    skip
    triangle = Triangle.new(4)
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
    assert_equal expected, triangle.rows
  end

  def test_five_rows
    skip
    triangle = Triangle.new(5)
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    assert_equal expected, triangle.rows
  end

  def test_six_rows
    skip
    triangle = Triangle.new(6)
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]
    assert_equal expected, triangle.rows
  end

  def test_ten_rows
    skip
    triangle = Triangle.new(10)
    expected = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]]
    assert_equal expected, triangle.rows
  end
end

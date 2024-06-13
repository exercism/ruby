require 'minitest/autorun'
require_relative 'spiral_matrix'

class SpiralMatrixTest < Minitest::Test
  def test_empty_spiral
    # skip
    spiral = SpiralMatrix.new(0).matrix
    expected = []
    assert_equal expected, spiral
  end

  def test_trivial_spiral
    skip
    spiral = SpiralMatrix.new(1).matrix
    expected = [[1]]
    assert_equal expected, spiral
  end

  def test_spiral_of_size_2
    skip
    spiral = SpiralMatrix.new(2).matrix
    expected = [
      [1, 2],
      [4, 3]
    ]
    assert_equal expected, spiral
  end

  def test_spiral_of_size_3
    skip
    spiral = SpiralMatrix.new(3).matrix
    expected = [
      [1, 2, 3],
      [8, 9, 4],
      [7, 6, 5]
    ]
    assert_equal expected, spiral
  end

  def test_spiral_of_size_4
    skip
    spiral = SpiralMatrix.new(4).matrix
    expected = [
      [1, 2, 3, 4],
      [12, 13, 14, 5],
      [11, 16, 15, 6],
      [10, 9, 8, 7]
    ]
    assert_equal expected, spiral
  end

  def test_spiral_of_size_5
    skip
    spiral = SpiralMatrix.new(5).matrix
    expected = [
      [1, 2, 3, 4, 5],
      [16, 17, 18, 19, 6],
      [15, 24, 25, 20, 7],
      [14, 23, 22, 21, 8],
      [13, 12, 11, 10, 9]
    ]
    assert_equal expected, spiral
  end
end

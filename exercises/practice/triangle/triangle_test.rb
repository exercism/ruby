require 'minitest/autorun'
require_relative 'triangle'

class TriangleTest < Minitest::Test
  def test_all_sides_are_equal_on_equilateral_triangle
    # skip
    actual = Triangle.new([2, 2, 2]).equilateral?
    assert actual, "Expected 'true', triangle [2, 2, 2] is equilateral."
  end

  def test_any_side_is_unequal_on_equilateral_triangle
    skip
    actual = Triangle.new([2, 3, 2]).equilateral?
    refute actual, "Expected 'false', triangle [2, 3, 2] is not equilateral."
  end

  def test_no_sides_are_equal_on_equilateral_triangle
    skip
    actual = Triangle.new([5, 4, 6]).equilateral?
    refute actual, "Expected 'false', triangle [5, 4, 6] is not equilateral."
  end

  def test_all_zero_sides_is_not_a_triangle_on_equilateral_triangle
    skip
    actual = Triangle.new([0, 0, 0]).equilateral?
    refute actual, "Expected 'false', triangle [0, 0, 0] is not equilateral."
  end

  def test_sides_may_be_floats_on_equilateral_triangle
    skip
    actual = Triangle.new([0.5, 0.5, 0.5]).equilateral?
    assert actual, "Expected 'true', triangle [0.5, 0.5, 0.5] is equilateral."
  end

  def test_last_two_sides_are_equal_on_isosceles_triangle
    skip
    actual = Triangle.new([3, 4, 4]).isosceles?
    assert actual, "Expected 'true', triangle [3, 4, 4] is isosceles."
  end

  def test_first_two_sides_are_equal_on_isosceles_triangle
    skip
    actual = Triangle.new([4, 4, 3]).isosceles?
    assert actual, "Expected 'true', triangle [4, 4, 3] is isosceles."
  end

  def test_first_and_last_sides_are_equal_on_isosceles_triangle
    skip
    actual = Triangle.new([4, 3, 4]).isosceles?
    assert actual, "Expected 'true', triangle [4, 3, 4] is isosceles."
  end

  def test_equilateral_triangles_are_also_isosceles_on_isosceles_triangle
    skip
    actual = Triangle.new([4, 4, 4]).isosceles?
    assert actual, "Expected 'true', triangle [4, 4, 4] is isosceles."
  end

  def test_no_sides_are_equal_on_isosceles_triangle
    skip
    actual = Triangle.new([2, 3, 4]).isosceles?
    refute actual, "Expected 'false', triangle [2, 3, 4] is not isosceles."
  end

  def test_first_triangle_inequality_violation_on_isosceles_triangle
    skip
    actual = Triangle.new([1, 1, 3]).isosceles?
    refute actual, "Expected 'false', triangle [1, 1, 3] is not isosceles."
  end

  def test_second_triangle_inequality_violation_on_isosceles_triangle
    skip
    actual = Triangle.new([1, 3, 1]).isosceles?
    refute actual, "Expected 'false', triangle [1, 3, 1] is not isosceles."
  end

  def test_third_triangle_inequality_violation_on_isosceles_triangle
    skip
    actual = Triangle.new([3, 1, 1]).isosceles?
    refute actual, "Expected 'false', triangle [3, 1, 1] is not isosceles."
  end

  def test_sides_may_be_floats_on_isosceles_triangle
    skip
    actual = Triangle.new([0.5, 0.4, 0.5]).isosceles?
    assert actual, "Expected 'true', triangle [0.5, 0.4, 0.5] is isosceles."
  end

  def test_no_sides_are_equal_on_scalene_triangle
    skip
    actual = Triangle.new([5, 4, 6]).scalene?
    assert actual, "Expected 'true', triangle [5, 4, 6] is scalene."
  end

  def test_all_sides_are_equal_on_scalene_triangle
    skip
    actual = Triangle.new([4, 4, 4]).scalene?
    refute actual, "Expected 'false', triangle [4, 4, 4] is not scalene."
  end

  def test_first_and_second_sides_are_equal_on_scalene_triangle
    skip
    actual = Triangle.new([4, 4, 3]).scalene?
    refute actual, "Expected 'false', triangle [4, 4, 3] is not scalene."
  end

  def test_first_and_third_sides_are_equal_on_scalene_triangle
    skip
    actual = Triangle.new([3, 4, 3]).scalene?
    refute actual, "Expected 'false', triangle [3, 4, 3] is not scalene."
  end

  def test_second_and_third_sides_are_equal_on_scalene_triangle
    skip
    actual = Triangle.new([4, 3, 3]).scalene?
    refute actual, "Expected 'false', triangle [4, 3, 3] is not scalene."
  end

  def test_may_not_violate_triangle_inequality_on_scalene_triangle
    skip
    actual = Triangle.new([7, 3, 2]).scalene?
    refute actual, "Expected 'false', triangle [7, 3, 2] is not scalene."
  end

  def test_sides_may_be_floats_on_scalene_triangle
    skip
    actual = Triangle.new([0.5, 0.4, 0.6]).scalene?
    assert actual, "Expected 'true', triangle [0.5, 0.4, 0.6] is scalene."
  end
end

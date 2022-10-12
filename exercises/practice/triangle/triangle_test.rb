require 'minitest/autorun'
require_relative 'triangle'

class TriangleTest < Minitest::Test
  def test_equilateral_triangle_all_sides_are_equal
    # skip
    triangle = Triangle.new([2, 2, 2])
    assert triangle.equilateral?, "Expected 'true', triangle [2, 2, 2] is equilateral."
  end

  def test_equilateral_triangle_any_side_is_unequal
    skip
    triangle = Triangle.new([2, 3, 2])
    refute triangle.equilateral?, "Expected 'false', triangle [2, 3, 2] is not equilateral."
  end

  def test_equilateral_triangle_no_sides_are_equal
    skip
    triangle = Triangle.new([5, 4, 6])
    refute triangle.equilateral?, "Expected 'false', triangle [5, 4, 6] is not equilateral."
  end

  def test_equilateral_triangle_all_zero_sides_is_not_a_triangle
    skip
    triangle = Triangle.new([0, 0, 0])
    refute triangle.equilateral?, "Expected 'false', triangle [0, 0, 0] is not equilateral."
  end

  def test_equilateral_triangle_sides_may_be_floats
    skip
    triangle = Triangle.new([0.5, 0.5, 0.5])
    assert triangle.equilateral?, "Expected 'true', triangle [0.5, 0.5, 0.5] is equilateral."
  end

  def test_isosceles_triangle_last_two_sides_are_equal
    skip
    triangle = Triangle.new([3, 4, 4])
    assert triangle.isosceles?, "Expected 'true', triangle [3, 4, 4] is isosceles."
  end

  def test_isosceles_triangle_first_two_sides_are_equal
    skip
    triangle = Triangle.new([4, 4, 3])
    assert triangle.isosceles?, "Expected 'true', triangle [4, 4, 3] is isosceles."
  end

  def test_isosceles_triangle_first_and_last_sides_are_equal
    skip
    triangle = Triangle.new([4, 3, 4])
    assert triangle.isosceles?, "Expected 'true', triangle [4, 3, 4] is isosceles."
  end

  def test_isosceles_triangle_equilateral_triangles_are_also_isosceles
    skip
    triangle = Triangle.new([4, 4, 4])
    assert triangle.isosceles?, "Expected 'true', triangle [4, 4, 4] is isosceles."
  end

  def test_isosceles_triangle_no_sides_are_equal
    skip
    triangle = Triangle.new([2, 3, 4])
    refute triangle.isosceles?, "Expected 'false', triangle [2, 3, 4] is not isosceles."
  end

  def test_isosceles_triangle_first_triangle_inequality_violation
    skip
    triangle = Triangle.new([1, 1, 3])
    refute triangle.isosceles?, "Expected 'false', triangle [1, 1, 3] is not isosceles."
  end

  def test_isosceles_triangle_second_triangle_inequality_violation
    skip
    triangle = Triangle.new([1, 3, 1])
    refute triangle.isosceles?, "Expected 'false', triangle [1, 3, 1] is not isosceles."
  end

  def test_isosceles_triangle_third_triangle_inequality_violation
    skip
    triangle = Triangle.new([3, 1, 1])
    refute triangle.isosceles?, "Expected 'false', triangle [3, 1, 1] is not isosceles."
  end

  def test_isosceles_triangle_sides_may_be_floats
    skip
    triangle = Triangle.new([0.5, 0.4, 0.5])
    assert triangle.isosceles?, "Expected 'true', triangle [0.5, 0.4, 0.5] is isosceles."
  end

  def test_scalene_triangle_no_sides_are_equal
    skip
    triangle = Triangle.new([5, 4, 6])
    assert triangle.scalene?, "Expected 'true', triangle [5, 4, 6] is scalene."
  end

  def test_scalene_triangle_all_sides_are_equal
    skip
    triangle = Triangle.new([4, 4, 4])
    refute triangle.scalene?, "Expected 'false', triangle [4, 4, 4] is not scalene."
  end

  def test_scalene_triangle_first_and_second_sides_are_equal
    skip
    triangle = Triangle.new([4, 4, 3])
    refute triangle.scalene?, "Expected 'false', triangle [4, 4, 3] is not scalene."
  end

  def test_scalene_triangle_first_and_third_sides_are_equal
    skip
    triangle = Triangle.new([3, 4, 3])
    refute triangle.scalene?, "Expected 'false', triangle [3, 4, 3] is not scalene."
  end

  def test_scalene_triangle_second_and_third_sides_are_equal
    skip
    triangle = Triangle.new([4, 3, 3])
    refute triangle.scalene?, "Expected 'false', triangle [4, 3, 3] is not scalene."
  end

  def test_scalene_triangle_may_not_violate_triangle_inequality
    skip
    triangle = Triangle.new([7, 3, 2])
    refute triangle.scalene?, "Expected 'false', triangle [7, 3, 2] is not scalene."
  end

  def test_scalene_triangle_sides_may_be_floats
    skip
    triangle = Triangle.new([0.5, 0.4, 0.6])
    assert triangle.scalene?, "Expected 'true', triangle [0.5, 0.4, 0.6] is scalene."
  end
end

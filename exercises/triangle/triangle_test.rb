#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'triangle'

# Common test data version: 1.0.0 fa90b35
class TriangleTest < Minitest::Test
  def test_triangle_is_equilateral_if_all_sides_are_equal
    # skip
    triangle = Triangle.new([2, 2, 2])
    assert triangle.equilateral?, "Expected 'true', triangle [2, 2, 2] is equilateral."
  end

  def test_triangle_is_not_equilateral_if_any_side_is_unequal
    skip
    triangle = Triangle.new([2, 3, 2])
    refute triangle.equilateral?, "Expected 'false', triangle [2, 3, 2] is not equilateral."
  end

  def test_triangle_is_not_equilateral_if_no_sides_are_equal
    skip
    triangle = Triangle.new([5, 4, 6])
    refute triangle.equilateral?, "Expected 'false', triangle [5, 4, 6] is not equilateral."
  end

  def test_all_zero_sides_are_illegal_so_the_triangle_is_not_equilateral
    skip
    triangle = Triangle.new([0, 0, 0])
    refute triangle.equilateral?, "Expected 'false', triangle [0, 0, 0] is not equilateral."
  end

  def test_equilateral_triangle_sides_may_be_floats
    skip
    triangle = Triangle.new([0.5, 0.5, 0.5])
    assert triangle.equilateral?, "Expected 'true', triangle [0.5, 0.5, 0.5] is equilateral."
  end

  def test_triangle_is_isosceles_if_last_two_sides_are_equal
    skip
    triangle = Triangle.new([3, 4, 4])
    assert triangle.isosceles?, "Expected 'true', triangle [3, 4, 4] is isosceles."
  end

  def test_triangle_is_isosceles_if_first_two_sides_are_equal
    skip
    triangle = Triangle.new([4, 4, 3])
    assert triangle.isosceles?, "Expected 'true', triangle [4, 4, 3] is isosceles."
  end

  def test_triangle_is_isosceles_if_first_and_last_sides_are_equal
    skip
    triangle = Triangle.new([4, 3, 4])
    assert triangle.isosceles?, "Expected 'true', triangle [4, 3, 4] is isosceles."
  end

  def test_equilateral_triangles_are_also_isosceles
    skip
    triangle = Triangle.new([4, 4, 4])
    assert triangle.isosceles?, "Expected 'true', triangle [4, 4, 4] is isosceles."
  end

  def test_triangle_is_not_isosceles_if_no_sides_are_equal
    skip
    triangle = Triangle.new([2, 3, 4])
    refute triangle.isosceles?, "Expected 'false', triangle [2, 3, 4] is not isosceles."
  end

  def test_sides_that_violate_triangle_inequality_are_not_isosceles_even_if_two_are_equal
    skip
    triangle = Triangle.new([1, 1, 3])
    refute triangle.isosceles?, "Expected 'false', triangle [1, 1, 3] is not isosceles."
  end

  def test_isosceles_triangle_sides_may_be_floats
    skip
    triangle = Triangle.new([0.5, 0.4, 0.5])
    assert triangle.isosceles?, "Expected 'true', triangle [0.5, 0.4, 0.5] is isosceles."
  end

  def test_triangle_is_scalene_if_no_sides_are_equal
    skip
    triangle = Triangle.new([5, 4, 6])
    assert triangle.scalene?, "Expected 'true', triangle [5, 4, 6] is scalene."
  end

  def test_triangle_is_not_scalene_if_all_sides_are_equal
    skip
    triangle = Triangle.new([4, 4, 4])
    refute triangle.scalene?, "Expected 'false', triangle [4, 4, 4] is not scalene."
  end

  def test_triangle_is_not_scalene_if_two_sides_are_equal
    skip
    triangle = Triangle.new([4, 4, 3])
    refute triangle.scalene?, "Expected 'false', triangle [4, 4, 3] is not scalene."
  end

  def test_sides_that_violate_triangle_inequality_are_not_scalene_even_if_they_are_all_different
    skip
    triangle = Triangle.new([7, 3, 2])
    refute triangle.scalene?, "Expected 'false', triangle [7, 3, 2] is not scalene."
  end

  def test_scalene_triangle_sides_may_be_floats
    skip
    triangle = Triangle.new([0.5, 0.4, 0.6])
    assert triangle.scalene?, "Expected 'true', triangle [0.5, 0.4, 0.6] is scalene."
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end

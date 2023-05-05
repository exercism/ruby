require 'minitest/autorun'
require_relative 'saddle_points'

class SaddlePointsTest < Minitest::Test
  def test_can_identify_single_saddle_point
    # skip
    input = [[9, 8, 7], [5, 3, 2], [6, 6, 7]]
    expected = [{ "row" => 2, "column" => 1 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_that_empty_matrix_has_no_saddle_points
    skip
    input = [[]]
    expected = [].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_lack_of_saddle_points_when_there_are_none
    skip
    input = [[1, 2, 3], [3, 1, 2], [2, 3, 1]]
    expected = [].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_multiple_saddle_points_in_a_column
    skip
    input = [[4, 5, 4], [3, 5, 5], [1, 5, 4]]
    expected = [{ "row" => 1, "column" => 2 }, { "row" => 2, "column" => 2 }, { "row" => 3, "column" => 2 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_multiple_saddle_points_in_a_row
    skip
    input = [[6, 7, 8], [5, 5, 5], [7, 5, 6]]
    expected = [{ "row" => 2, "column" => 1 }, { "row" => 2, "column" => 2 }, { "row" => 2, "column" => 3 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_saddle_point_in_bottom_right_corner
    skip
    input = [[8, 7, 9], [6, 7, 6], [3, 2, 5]]
    expected = [{ "row" => 3, "column" => 3 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_saddle_points_in_a_non_square_matrix
    skip
    input = [[3, 1, 3], [3, 2, 4]]
    expected = [{ "row" => 1, "column" => 3 }, { "row" => 1, "column" => 1 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_that_saddle_points_in_a_single_column_matrix_are_those_with_the_minimum_value
    skip
    input = [[2], [1], [4], [1]]
    expected = [{ "row" => 2, "column" => 1 }, { "row" => 4, "column" => 1 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end

  def test_can_identify_that_saddle_points_in_a_single_row_matrix_are_those_with_the_maximum_value
    skip
    input = [[2, 5, 3, 5]]
    expected = [{ "row" => 1, "column" => 2 }, { "row" => 1, "column" => 4 }].sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    actual = Grid.saddle_points(input).sort_by do |coordinates|
      [coordinates["row"], coordinates["column"]]
    end
    assert_equal expected, actual
  end
end

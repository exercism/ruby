require 'minitest/autorun'
require_relative 'flatten_array'

class FlattenArrayTest < Minitest::Test
  def test_empty
    # skip
    input = []
    expected = []
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_no_nesting
    skip
    input = [0, 1, 2]
    expected = [0, 1, 2]
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_flattens_a_nested_array
    skip
    input = [[[]]]
    expected = []
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_flattens_array_with_just_integers_present
    skip
    input = [1, [2, 3, 4, 5, 6, 7], 8]
    expected = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_5_level_nesting
    skip
    input = [0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2]
    expected = [0, 2, 2, 3, 8, 100, 4, 50, -2]
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_6_level_nesting
    skip
    input = [1, [2, [[3]], [4, [[5]]], 6, 7], 8]
    expected = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_6_level_nest_list_with_null_values
    skip
    input = [0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2]
    expected = [0, 2, 2, 3, 8, 100, -2]
    assert_equal expected, FlattenArray.flatten(input)
  end

  def test_all_values_in_nested_list_are_null
    skip
    input = [nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]
    expected = []
    assert_equal expected, FlattenArray.flatten(input)
  end
end

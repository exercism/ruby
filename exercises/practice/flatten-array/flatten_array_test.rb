require 'minitest/autorun'
require_relative 'flatten_array'

# Common test data version: 1.2.0 0290376
class FlattenArrayTest < Minitest::Test
  def test_no_nesting
    # skip
    flat_array = FlattenArray.flatten([0, 1, 2])
    assert_equal [0, 1, 2], flat_array
  end

  def test_flattens_array_with_just_integers_present
    skip
    flat_array = FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], flat_array
  end

  def test_5_level_nesting
    skip
    flat_array = FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
    assert_equal [0, 2, 2, 3, 8, 100, 4, 50, -2], flat_array
  end

  def test_6_level_nesting
    skip
    flat_array = FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], flat_array
  end

  def test_6_level_nest_list_with_nil_values
    skip
    flat_array = FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
    assert_equal [0, 2, 2, 3, 8, 100, -2], flat_array
  end

  def test_all_values_in_nested_list_are_nil
    skip
    flat_array = FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil])
    assert_equal [], flat_array
  end
end

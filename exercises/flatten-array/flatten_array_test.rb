require 'minitest/autorun'
require_relative 'flatten_array'

# Common test data version: 1.1.0 d7a3c09
class FlattenArrayTest < Minitest::Test
  def test_no_nesting
    # skip
    fa = FlattenArray.flatten([0, 1, 2])
    assert_equal [0, 1, 2], fa
  end

  def test_flattens_array_with_just_integers_present
    skip
    fa = FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], fa
  end

  def test_5_level_nesting
    skip
    fa = FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
    assert_equal [0, 2, 2, 3, 8, 100, 4, 50, -2], fa
  end

  def test_6_level_nesting
    skip
    fa = FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], fa
  end

  def test_6_level_nest_list_with_null_values
    skip
    fa = FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
    assert_equal [0, 2, 2, 3, 8, 100, -2], fa
  end

  def test_all_values_in_nested_list_are_null
    skip
    fa = FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil])
    assert_equal [], fa
  end
end

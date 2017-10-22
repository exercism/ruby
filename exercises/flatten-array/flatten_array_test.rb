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

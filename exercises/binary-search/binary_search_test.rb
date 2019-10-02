require 'minitest/autorun'
require_relative 'binary_search'

# Common test data version: 1.3.0 bfb218f
class BinarySearchTest < Minitest::Test
  def test_finds_a_value_in_an_array_with_one_element
    # skip
    binary = BinarySearch.new([6])
    assert_equal 0, binary.search_for(6)
  end

  def test_finds_a_value_in_the_middle_of_an_array
    skip
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_equal 3, binary.search_for(6)
  end

  def test_finds_a_value_at_the_beginning_of_an_array
    skip
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_equal 0, binary.search_for(1)
  end

  def test_finds_a_value_at_the_end_of_an_array
    skip
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_equal 6, binary.search_for(11)
  end

  def test_finds_a_value_in_an_array_of_odd_length
    skip
    binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634])
    assert_equal 9, binary.search_for(144)
  end

  def test_finds_a_value_in_an_array_of_even_length
    skip
    binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])
    assert_equal 5, binary.search_for(21)
  end

  def test_identifies_that_a_value_is_not_included_in_the_array
    skip
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_nil binary.search_for(7)
  end

  def test_a_value_smaller_than_the_array_s_smallest_value_is_not_found
    skip
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_nil binary.search_for(0)
  end

  def test_a_value_larger_than_the_array_s_largest_value_is_not_found
    skip
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_nil binary.search_for(13)
  end

  def test_nothing_is_found_in_an_empty_array
    skip
    binary = BinarySearch.new([])
    assert_nil binary.search_for(1)
  end

  def test_nothing_is_found_when_the_left_and_right_bounds_cross
    skip
    binary = BinarySearch.new([1, 2])
    assert_nil binary.search_for(0)
  end
end

require 'minitest/autorun'
require_relative 'sublist'

# Common test data version: 1.0.0 71e24b5
class SublistTest < Minitest::Test
  def test_empty_lists
    # skip
    l1 = List.new([])
    l2 = List.new([])
    assert l1.sublist?(l2)
    assert l1.superlist?(l2)
    assert l1 == l2
  end

  def test_empty_list_within_non_empty_list
    skip
    l1 = List.new([])
    l2 = List.new([1, 2, 3])
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_non_empty_list_contains_empty_list
    skip
    l1 = List.new([1, 2, 3])
    l2 = List.new([])
    refute l1.sublist?(l2)
    assert l1.superlist?(l2)
    refute l1 == l2
  end

  def test_list_equals_itself
    skip
    l1 = List.new([1, 2, 3])
    l2 = List.new([1, 2, 3])
    assert l1.sublist?(l2)
    assert l1.superlist?(l2)
    assert l1 == l2
  end

  def test_different_lists
    skip
    l1 = List.new([1, 2, 3])
    l2 = List.new([2, 3, 4])
    refute l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_false_start
    skip
    l1 = List.new([1, 2, 5])
    l2 = List.new([0, 1, 2, 3, 1, 2, 5, 6])
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_consecutive
    skip
    l1 = List.new([1, 1, 2])
    l2 = List.new([0, 1, 1, 1, 2, 1, 2])
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_sublist_at_start
    skip
    l1 = List.new([0, 1, 2])
    l2 = List.new([0, 1, 2, 3, 4, 5])
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_sublist_in_middle
    skip
    l1 = List.new([2, 3, 4])
    l2 = List.new([0, 1, 2, 3, 4, 5])
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_sublist_at_end
    skip
    l1 = List.new([3, 4, 5])
    l2 = List.new([0, 1, 2, 3, 4, 5])
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_at_start_of_superlist
    skip
    l1 = List.new([0, 1, 2, 3, 4, 5])
    l2 = List.new([0, 1, 2])
    refute l1.sublist?(l2)
    assert l1.superlist?(l2)
    refute l1 == l2
  end

  def test_in_middle_of_superlist
    skip
    l1 = List.new([0, 1, 2, 3, 4, 5])
    l2 = List.new([2, 3])
    refute l1.sublist?(l2)
    assert l1.superlist?(l2)
    refute l1 == l2
  end

  def test_at_end_of_superlist
    skip
    l1 = List.new([0, 1, 2, 3, 4, 5])
    l2 = List.new([3, 4, 5])
    refute l1.sublist?(l2)
    assert l1.superlist?(l2)
    refute l1 == l2
  end

  def test_first_list_missing_element_from_second_list
    skip
    l1 = List.new([1, 3])
    l2 = List.new([1, 2, 3])
    refute l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_second_list_missing_element_from_first_list
    skip
    l1 = List.new([1, 2, 3])
    l2 = List.new([1, 3])
    refute l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_order_matters_to_a_list
    skip
    l1 = List.new([1, 2, 3])
    l2 = List.new([3, 2, 1])
    refute l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
  end

  def test_same_digits_but_different_numbers
    skip
    l1 = List.new([1, 0, 1])
    l2 = List.new([10, 1])
    refute l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2
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

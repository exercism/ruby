require 'minitest/autorun'
require_relative 'book_store'

# Common test data version: 1.1.0 a636903
class BookStoreTest < Minitest::Test
  def test_only_a_single_book
    # skip
    assert_equal 8.0, BookStore.calculate_price([1])
  end

  def test_two_of_the_same_book
    skip
    assert_equal 16.0, BookStore.calculate_price([2, 2])
  end

  def test_empty_basket
    skip
    assert_equal 0.0, BookStore.calculate_price([])
  end

  def test_two_different_books
    skip
    assert_equal 15.2, BookStore.calculate_price([1, 2])
  end

  def test_three_different_books
    skip
    assert_equal 21.6, BookStore.calculate_price([1, 2, 3])
  end

  def test_four_different_books
    skip
    assert_equal 25.6, BookStore.calculate_price([1, 2, 3, 4])
  end

  def test_five_different_books
    skip
    assert_equal 30.0, BookStore.calculate_price([1, 2, 3, 4, 5])
  end

  def test_two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three
    skip
    assert_equal 51.2, BookStore.calculate_price([1, 1, 2, 2, 3, 3, 4, 5])
  end

  def test_group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three
    skip
    assert_equal 40.8, BookStore.calculate_price([1, 1, 2, 2, 3, 4])
  end

  def test_two_each_of_first_4_books_and_1_copy_each_of_rest
    skip
    assert_equal 55.6, BookStore.calculate_price([1, 1, 2, 2, 3, 3, 4, 4, 5])
  end

  def test_two_copies_of_each_book
    skip
    assert_equal 60.0, BookStore.calculate_price([1, 1, 2, 2, 3, 3, 4, 4, 5, 5])
  end

  def test_three_copies_of_first_book_and_2_each_of_remaining
    skip
    assert_equal 68.0, BookStore.calculate_price([1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1])
  end

  def test_three_each_of_first_2_books_and_2_each_of_remaining_books
    skip
    assert_equal 75.2, BookStore.calculate_price([1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2])
  end

  def test_four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three
    skip
    assert_equal 102.4, BookStore.calculate_price([1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5])
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
    assert_equal 0, BookKeeping::VERSION
  end
end

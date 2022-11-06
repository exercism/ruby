require 'minitest/autorun'
require_relative 'book_store'

class BookStoreTest < Minitest::Test
  def test_only_a_single_book
    # skip
    basket = [1]
    assert_in_delta 8.00, BookStore.calculate_price(basket), 0.001
  end

  def test_two_of_the_same_book
    skip
    basket = [2, 2]
    assert_in_delta 16.00, BookStore.calculate_price(basket), 0.001
  end

  def test_empty_basket
    skip
    basket = []
    assert_in_delta 0.00, BookStore.calculate_price(basket), 0.001
  end

  def test_two_different_books
    skip
    basket = [1, 2]
    assert_in_delta 15.20, BookStore.calculate_price(basket), 0.001
  end

  def test_three_different_books
    skip
    basket = [1, 2, 3]
    assert_in_delta 21.60, BookStore.calculate_price(basket), 0.001
  end

  def test_four_different_books
    skip
    basket = [1, 2, 3, 4]
    assert_in_delta 25.60, BookStore.calculate_price(basket), 0.001
  end

  def test_five_different_books
    skip
    basket = [1, 2, 3, 4, 5]
    assert_in_delta 30.00, BookStore.calculate_price(basket), 0.001
  end

  def test_two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three
    skip
    basket = [1, 1, 2, 2, 3, 3, 4, 5]
    assert_in_delta 51.20, BookStore.calculate_price(basket), 0.001
  end

  def test_two_groups_of_four_is_cheaper_than_groups_of_five_and_three
    skip
    basket = [1, 1, 2, 3, 4, 4, 5, 5]
    assert_in_delta 51.20, BookStore.calculate_price(basket), 0.001
  end

  def test_group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three
    skip
    basket = [1, 1, 2, 2, 3, 4]
    assert_in_delta 40.80, BookStore.calculate_price(basket), 0.001
  end

  def test_two_each_of_first_four_books_and_one_copy_each_of_rest
    skip
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5]
    assert_in_delta 55.60, BookStore.calculate_price(basket), 0.001
  end

  def test_two_copies_of_each_book
    skip
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
    assert_in_delta 60.00, BookStore.calculate_price(basket), 0.001
  end

  def test_three_copies_of_first_book_and_two_each_of_remaining
    skip
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1]
    assert_in_delta 68.00, BookStore.calculate_price(basket), 0.001
  end

  def test_three_each_of_first_two_books_and_two_each_of_remaining_books
    skip
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2]
    assert_in_delta 75.20, BookStore.calculate_price(basket), 0.001
  end

  def test_four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three
    skip
    basket = [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5]
    assert_in_delta 102.40, BookStore.calculate_price(basket), 0.001
  end

  def test_check_that_groups_of_four_are_created_properly_even_when_there_are_more_groups_of_three_than_groups_of_five
    skip
    basket = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5]
    assert_in_delta 145.60, BookStore.calculate_price(basket), 0.001
  end

  def test_one_group_of_one_and_four_is_cheaper_than_one_group_of_two_and_three
    skip
    basket = [1, 1, 2, 3, 4]
    assert_in_delta 33.60, BookStore.calculate_price(basket), 0.001
  end

  def test_one_group_of_one_and_two_plus_three_groups_of_four_is_cheaper_than_one_group_of_each_size
    skip
    basket = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5]
    assert_in_delta 100.00, BookStore.calculate_price(basket), 0.001
  end
end

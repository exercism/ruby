require 'minitest/autorun'
require_relative 'palindrome_products'

class PalindromesTest < Minitest::Test
  def test_for_the_smallest_palindrome_from_single_digit_factors
    # skip
    palindromes = Palindromes.new(max_factor: 9)
    palindromes.generate
    actual = palindromes.smallest.value, palindromes.smallest.factors
    expected = 1, [[1, 1]]
    assert_equal expected, actual
  end

  def test_for_the_largest_palindrome_from_single_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 9)
    palindromes.generate
    actual = palindromes.largest.value, palindromes.largest.factors
    expected = [9, [[1, 9], [3, 3]]], [9, [[3, 3], [1, 9]]]
    assert_includes expected, actual
  end

  def test_for_the_smallest_palindrome_from_double_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    palindromes.generate
    actual = palindromes.smallest.value, palindromes.smallest.factors
    expected = 121, [[11, 11]]
    assert_equal expected, actual
  end

  def test_for_the_largest_palindrome_from_double_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    palindromes.generate
    actual = palindromes.largest.value, palindromes.largest.factors
    expected = 9009, [[91, 99]]
    assert_equal expected, actual
  end

  def test_for_the_smallest_palindrome_from_triple_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    palindromes.generate
    actual = palindromes.smallest.value, palindromes.smallest.factors
    expected = 10_201, [[101, 101]]
    assert_equal expected, actual
  end

  def test_for_the_largest_palindrome_from_triple_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    palindromes.generate
    actual = palindromes.largest.value, palindromes.largest.factors
    expected = 906_609, [[913, 993]]
    assert_equal expected, actual
  end

  def test_for_the_smallest_palindrome_from_four_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 9999, min_factor: 1000)
    palindromes.generate
    actual = palindromes.smallest.value, palindromes.smallest.factors
    expected = 1_002_001, [[1001, 1001]]
    assert_equal expected, actual
  end

  def test_for_the_largest_palindrome_from_four_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 9999, min_factor: 1000)
    palindromes.generate
    actual = palindromes.largest.value, palindromes.largest.factors
    expected = 99_000_099, [[9901, 9999]]
    assert_equal expected, actual
  end

  def test_empty_result_for_smallest_if_no_palindrome_in_the_range
    skip
    palindromes = Palindromes.new(max_factor: 1003, min_factor: 1002)
    palindromes.generate
    actual = palindromes.smallest.value, palindromes.smallest.factors
    expected = nil, []
    assert_equal expected, actual
  end

  def test_empty_result_for_largest_if_no_palindrome_in_the_range
    skip
    palindromes = Palindromes.new(max_factor: 15, min_factor: 15)
    palindromes.generate
    actual = palindromes.largest.value, palindromes.largest.factors
    expected = nil, []
    assert_equal expected, actual
  end

  def test_error_result_for_smallest_if_min_is_more_than_max
    skip
    error = assert_raises(ArgumentError) do
      palindromes = Palindromes.new(max_factor: 1, min_factor: 10_000)
      palindromes.generate
      palindromes.smallest
    end
    assert_equal "min must be <= max", error.message
  end

  def test_error_result_for_largest_if_min_is_more_than_max
    skip
    error = assert_raises(ArgumentError) do
      palindromes = Palindromes.new(max_factor: 1, min_factor: 2)
      palindromes.generate
      palindromes.largest
    end
    assert_equal "min must be <= max", error.message
  end

  def test_smallest_product_does_not_use_the_smallest_factor
    skip
    palindromes = Palindromes.new(max_factor: 4000, min_factor: 3215)
    palindromes.generate
    actual = palindromes.smallest.value, palindromes.smallest.factors
    expected = 10_988_901, [[3297, 3333]]
    assert_equal expected, actual
  end
end

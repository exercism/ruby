require 'minitest/autorun'
require_relative 'palindrome_products'

class PalindromesTest < Minitest::Test
  def test_smallest_palindrome_from_single_digit_factors
    palindromes = Palindromes.new(max_factor: 9)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 1, smallest.value
    assert_equal [[1, 1]], smallest.factors
  end

  def test_largest_palindrome_from_single_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 9)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 9, largest.value
    assert_includes [[[3, 3], [1, 9]], [[1, 9], [3, 3]]], largest.factors
  end

  def test_largest_palindrome_from_double_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 9009, largest.value
    assert_equal [[91, 99]], largest.factors
  end

  def test_smallest_palindrome_from_double_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 121, smallest.value
    assert_equal [[11, 11]], smallest.factors
  end

  def test_largest_palindrome_from_triple_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 906_609, largest.value
    assert_equal [[913, 993]], largest.factors
  end

  def test_smallest_palindrome_from_triple_digit_factors
    skip
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 10_201, smallest.value
    assert_equal [[101, 101]], smallest.factors
  end

  def test_smallest_palindrome_from_four_digit_factors
    skip
    palindromes = Palindromes.new(min_factor: 1000, max_factor: 9999)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 1_002_001, smallest.value
    assert_equal [[1001, 1001]], smallest.factors
  end

  def test_largest_palindrome_from_four_digit_factors
    skip
    palindromes = Palindromes.new(min_factor: 1000, max_factor: 9999)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 99_000_099, largest.value
    assert_equal [[9901, 9999]], largest.factors
  end

  def test_empty_for_smallest_if_no_palindrome_in_range
    skip
    palindromes = Palindromes.new(min_factor: 1002, max_factor: 1003)
    palindromes.generate
    smallest = palindromes.smallest
    assert_nil smallest.value
    assert_empty smallest.factors
  end

  def test_empty_for_largest_if_no_palindrome_in_range
    skip
    palindromes = Palindromes.new(min_factor: 15, max_factor: 15)
    palindromes.generate
    largest = palindromes.largest
    assert_nil largest.value
    assert_empty largest.factors
  end

  def test_error_for_smallest_if_min_more_than_max
    skip
    error = assert_raises(ArgumentError) do
      palindromes = Palindromes.new(min_factor: 10_000, max_factor: 1)
      palindromes.generate
      palindromes.smallest
    end
    assert_equal "min must be <= max", error.message
  end

  def test_error_for_largest_if_min_more_than_max
    skip
    error = assert_raises(ArgumentError) do
      palindromes = Palindromes.new(min_factor: 2, max_factor: 1)
      palindromes.generate
      palindromes.smallest
    end
    assert_equal "min must be <= max", error.message
  end

  def test_smallest_palindrome_does_not_use_smallest_factors
    skip
    palindromes = Palindromes.new(min_factor: 3215, max_factor: 4000)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 10_988_901, smallest.value
    assert_equal [[3297, 3333]], smallest.factors
  end
end

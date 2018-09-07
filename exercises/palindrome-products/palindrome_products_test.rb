require 'minitest/autorun'
require_relative 'palindrome_products'

class PalindromesTest < Minitest::Test
  def test_largest_palindrome_from_single_digit_factors
    palindromes = Palindromes.new(max_factor: 9)
    assert_equal 9, palindromes.largest
  end

  def test_largest_palindrome_from_double_digit_factors
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    assert_equal 9009, palindromes.largest
  end

  def test_smallest_palindrome_from_double_digit_factors
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    assert_equal 121, palindromes.smallest
  end

  def test_largest_palindrome_from_triple_digit_factors
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    assert_equal 906_609, palindromes.largest
  end

  def test_smallest_palindrome_from_triple_digit_factors
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    assert_equal 10_201, palindromes.smallest
  end
end

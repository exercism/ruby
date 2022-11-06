require 'minitest/autorun'
require_relative 'prime_factors'

class PrimeFactorsTest < Minitest::Test
  def test_no_factors
    # skip
    assert_empty PrimeFactors.of(1)
  end

  def test_prime_number
    skip
    assert_equal [2], PrimeFactors.of(2)
  end

  def test_another_prime_number
    skip
    assert_equal [3], PrimeFactors.of(3)
  end

  def test_square_of_a_prime
    skip
    assert_equal [3, 3], PrimeFactors.of(9)
  end

  def test_product_of_first_prime
    skip
    assert_equal [2, 2], PrimeFactors.of(4)
  end

  def test_cube_of_a_prime
    skip
    assert_equal [2, 2, 2], PrimeFactors.of(8)
  end

  def test_product_of_second_prime
    skip
    assert_equal [3, 3, 3], PrimeFactors.of(27)
  end

  def test_product_of_third_prime
    skip
    assert_equal [5, 5, 5, 5], PrimeFactors.of(625)
  end

  def test_product_of_first_and_second_prime
    skip
    assert_equal [2, 3], PrimeFactors.of(6)
  end

  def test_product_of_primes_and_non_primes
    skip
    assert_equal [2, 2, 3], PrimeFactors.of(12)
  end

  def test_product_of_primes
    skip
    assert_equal [5, 17, 23, 461], PrimeFactors.of(901_255)
  end

  def test_factors_include_a_large_prime
    skip
    assert_equal [11, 9539, 894_119], PrimeFactors.of(93_819_012_551)
  end
end

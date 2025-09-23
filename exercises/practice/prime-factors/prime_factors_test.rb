require 'minitest/autorun'
require_relative 'prime_factors'

class PrimeFactorsTest < Minitest::Test
  def test_no_factors
    # skip
    actual = PrimeFactors.of(1)
    expected = []
    assert_equal expected, actual
  end

  def test_prime_number
    skip
    actual = PrimeFactors.of(2)
    expected = [2]
    assert_equal expected, actual
  end

  def test_another_prime_number
    skip
    actual = PrimeFactors.of(3)
    expected = [3]
    assert_equal expected, actual
  end

  def test_square_of_a_prime
    skip
    actual = PrimeFactors.of(9)
    expected = [3, 3]
    assert_equal expected, actual
  end

  def test_product_of_first_prime
    skip
    actual = PrimeFactors.of(4)
    expected = [2, 2]
    assert_equal expected, actual
  end

  def test_cube_of_a_prime
    skip
    actual = PrimeFactors.of(8)
    expected = [2, 2, 2]
    assert_equal expected, actual
  end

  def test_product_of_second_prime
    skip
    actual = PrimeFactors.of(27)
    expected = [3, 3, 3]
    assert_equal expected, actual
  end

  def test_product_of_third_prime
    skip
    actual = PrimeFactors.of(625)
    expected = [5, 5, 5, 5]
    assert_equal expected, actual
  end

  def test_product_of_first_and_second_prime
    skip
    actual = PrimeFactors.of(6)
    expected = [2, 3]
    assert_equal expected, actual
  end

  def test_product_of_primes_and_non_primes
    skip
    actual = PrimeFactors.of(12)
    expected = [2, 2, 3]
    assert_equal expected, actual
  end

  def test_product_of_primes
    skip
    actual = PrimeFactors.of(901_255)
    expected = [5, 17, 23, 461]
    assert_equal expected, actual
  end

  def test_factors_include_a_large_prime
    skip
    actual = PrimeFactors.of(93_819_012_551)
    expected = [11, 9539, 894_119]
    assert_equal expected, actual
  end
end

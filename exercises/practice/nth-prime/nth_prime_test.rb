require 'minitest/autorun'
require_relative 'nth_prime'

# Common test data version: 2.1.0 4a3ba76
class NthPrimeTest < Minitest::Test
  def test_first_prime
    # skip
    assert_equal 2, Prime.nth(1)
  end

  def test_second_prime
    skip
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    skip
    assert_equal 13, Prime.nth(6)
  end

  def test_big_prime
    skip
    assert_equal 104743, Prime.nth(10001)
  end

  def test_there_is_no_zeroth_prime
    skip
    assert_raises(ArgumentError) do
      Prime.nth(0)
    end
  end
end

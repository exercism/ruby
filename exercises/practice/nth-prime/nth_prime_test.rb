require 'minitest/autorun'
require_relative 'nth_prime'

class NthPrimeTest < Minitest::Test
  def test_first_prime
    # skip
    actual = Prime.nth(1)
    expected = 2
    assert_equal expected, actual
  end

  def test_second_prime
    skip
    actual = Prime.nth(2)
    expected = 3
    assert_equal expected, actual
  end

  def test_sixth_prime
    skip
    actual = Prime.nth(6)
    expected = 13
    assert_equal expected, actual
  end

  def test_big_prime
    skip
    actual = Prime.nth(10_001)
    expected = 104_743
    assert_equal expected, actual
  end

  def test_there_is_no_zeroth_prime
    skip
    assert_raises(ArgumentError) do
      Prime.nth(0)
    end
  end
end

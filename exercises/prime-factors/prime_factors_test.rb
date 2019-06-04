require 'minitest/autorun'
require_relative 'prime_factors'

class PrimeFactorsTest < Minitest::Test
  def test_1
    assert_equal [], PrimeFactors.of(1)
  end

  def test_2
    skip
    assert_equal [2], PrimeFactors.of(2)
  end

  def test_3
    skip
    assert_equal [3], PrimeFactors.of(3)
  end

  def test_4
    skip
    assert_equal [2, 2], PrimeFactors.of(4)
  end

  def test_6
    skip
    assert_equal [2, 3], PrimeFactors.of(6)
  end

  def test_8
    skip
    assert_equal [2, 2, 2], PrimeFactors.of(8)
  end

  def test_9
    skip
    assert_equal [3, 3], PrimeFactors.of(9)
  end

  def test_27
    skip
    assert_equal [3, 3, 3], PrimeFactors.of(27)
  end

  def test_625
    skip
    assert_equal [5, 5, 5, 5], PrimeFactors.of(625)
  end

  def test_901255
    skip
    assert_equal [5, 17, 23, 461], PrimeFactors.of(901_255)
  end

  def test_93819012551
    skip
    assert_equal [11, 9539, 894_119], PrimeFactors.of(93_819_012_551)
  end
end

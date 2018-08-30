require 'minitest/autorun'
require_relative 'sum_of_multiples'

# Common test data version: 1.2.0 fb5b0a1
class SumOfMultiplesTest < Minitest::Test
  def test_multiples_of_3_or_5_up_to_1
    # skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 0, sum_of_multiples.to(1)
  end

  def test_multiples_of_3_or_5_up_to_4
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 3, sum_of_multiples.to(4)
  end

  def test_multiples_of_3_up_to_7
    skip
    sum_of_multiples = SumOfMultiples.new(3)
    assert_equal 9, sum_of_multiples.to(7)
  end

  def test_multiples_of_3_or_5_up_to_10
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 23, sum_of_multiples.to(10)
  end

  def test_multiples_of_3_or_5_up_to_100
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 2_318, sum_of_multiples.to(100)
  end

  def test_multiples_of_3_or_5_up_to_1000
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 233_168, sum_of_multiples.to(1_000)
  end

  def test_multiples_of_7_13_or_17_up_to_20
    skip
    sum_of_multiples = SumOfMultiples.new(7, 13, 17)
    assert_equal 51, sum_of_multiples.to(20)
  end

  def test_multiples_of_4_or_6_up_to_15
    skip
    sum_of_multiples = SumOfMultiples.new(4, 6)
    assert_equal 30, sum_of_multiples.to(15)
  end

  def test_multiples_of_5_6_or_8_up_to_150
    skip
    sum_of_multiples = SumOfMultiples.new(5, 6, 8)
    assert_equal 4_419, sum_of_multiples.to(150)
  end

  def test_multiples_of_5_or_25_up_to_51
    skip
    sum_of_multiples = SumOfMultiples.new(5, 25)
    assert_equal 275, sum_of_multiples.to(51)
  end

  def test_multiples_of_43_or_47_up_to_10000
    skip
    sum_of_multiples = SumOfMultiples.new(43, 47)
    assert_equal 2_203_160, sum_of_multiples.to(10_000)
  end

  def test_multiples_of_1_up_to_100
    skip
    sum_of_multiples = SumOfMultiples.new(1)
    assert_equal 4_950, sum_of_multiples.to(100)
  end

  def test_multiples_of_an_empty_list_up_to_10000
    skip
    sum_of_multiples = SumOfMultiples.new()
    assert_equal 0, sum_of_multiples.to(10_000)
  end
end

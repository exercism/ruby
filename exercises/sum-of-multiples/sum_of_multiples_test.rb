require 'minitest/autorun'
require_relative 'sum_of_multiples'

# Common test data version: 1.4.1 8f89751
class SumOfMultiplesTest < Minitest::Test
  def test_no_multiples_within_limit
    # skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 0, sum_of_multiples.to(1)
  end

  def test_one_factor_has_multiples_within_limit
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 3, sum_of_multiples.to(4)
  end

  def test_more_than_one_multiple_within_limit
    skip
    sum_of_multiples = SumOfMultiples.new(3)
    assert_equal 9, sum_of_multiples.to(7)
  end

  def test_more_than_one_factor_with_multiples_within_limit
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 23, sum_of_multiples.to(10)
  end

  def test_each_multiple_is_only_counted_once
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 2_318, sum_of_multiples.to(100)
  end

  def test_a_much_larger_limit
    skip
    sum_of_multiples = SumOfMultiples.new(3, 5)
    assert_equal 233_168, sum_of_multiples.to(1_000)
  end

  def test_three_factors
    skip
    sum_of_multiples = SumOfMultiples.new(7, 13, 17)
    assert_equal 51, sum_of_multiples.to(20)
  end

  def test_factors_not_relatively_prime
    skip
    sum_of_multiples = SumOfMultiples.new(4, 6)
    assert_equal 30, sum_of_multiples.to(15)
  end

  def test_some_pairs_of_factors_relatively_prime_and_some_not
    skip
    sum_of_multiples = SumOfMultiples.new(5, 6, 8)
    assert_equal 4_419, sum_of_multiples.to(150)
  end

  def test_one_factor_is_a_multiple_of_another
    skip
    sum_of_multiples = SumOfMultiples.new(5, 25)
    assert_equal 275, sum_of_multiples.to(51)
  end

  def test_much_larger_factors
    skip
    sum_of_multiples = SumOfMultiples.new(43, 47)
    assert_equal 2_203_160, sum_of_multiples.to(10_000)
  end

  def test_all_numbers_are_multiples_of_1
    skip
    sum_of_multiples = SumOfMultiples.new(1)
    assert_equal 4_950, sum_of_multiples.to(100)
  end

  def test_no_factors_means_an_empty_sum
    skip
    sum_of_multiples = SumOfMultiples.new()
    assert_equal 0, sum_of_multiples.to(10_000)
  end

  def test_the_only_multiple_of_0_is_0
    skip
    sum_of_multiples = SumOfMultiples.new(0)
    assert_equal 0, sum_of_multiples.to(1)
  end

  def test_solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3
    skip
    sum_of_multiples = SumOfMultiples.new(2, 3, 5, 7, 11)
    assert_equal 39_614_537, sum_of_multiples.to(10_000)
  end
end

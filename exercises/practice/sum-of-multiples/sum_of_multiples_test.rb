require 'minitest/autorun'
require_relative 'sum_of_multiples'

class SumOfMultiplesTest < Minitest::Test
  def test_no_multiples_within_limit
    # skip
    actual = SumOfMultiples.new(3, 5).to(1)
    expected = 0
    assert_equal expected, actual
  end

  def test_one_factor_has_multiples_within_limit
    skip
    actual = SumOfMultiples.new(3, 5).to(4)
    expected = 3
    assert_equal expected, actual
  end

  def test_more_than_one_multiple_within_limit
    skip
    actual = SumOfMultiples.new(3).to(7)
    expected = 9
    assert_equal expected, actual
  end

  def test_more_than_one_factor_with_multiples_within_limit
    skip
    actual = SumOfMultiples.new(3, 5).to(10)
    expected = 23
    assert_equal expected, actual
  end

  def test_each_multiple_is_only_counted_once
    skip
    actual = SumOfMultiples.new(3, 5).to(100)
    expected = 2318
    assert_equal expected, actual
  end

  def test_a_much_larger_limit
    skip
    actual = SumOfMultiples.new(3, 5).to(1000)
    expected = 233_168
    assert_equal expected, actual
  end

  def test_three_factors
    skip
    actual = SumOfMultiples.new(7, 13, 17).to(20)
    expected = 51
    assert_equal expected, actual
  end

  def test_factors_not_relatively_prime
    skip
    actual = SumOfMultiples.new(4, 6).to(15)
    expected = 30
    assert_equal expected, actual
  end

  def test_some_pairs_of_factors_relatively_prime_and_some_not
    skip
    actual = SumOfMultiples.new(5, 6, 8).to(150)
    expected = 4419
    assert_equal expected, actual
  end

  def test_one_factor_is_a_multiple_of_another
    skip
    actual = SumOfMultiples.new(5, 25).to(51)
    expected = 275
    assert_equal expected, actual
  end

  def test_much_larger_factors
    skip
    actual = SumOfMultiples.new(43, 47).to(10_000)
    expected = 2_203_160
    assert_equal expected, actual
  end

  def test_all_numbers_are_multiples_of_1
    skip
    actual = SumOfMultiples.new(1).to(100)
    expected = 4950
    assert_equal expected, actual
  end

  def test_no_factors_means_an_empty_sum
    skip
    actual = SumOfMultiples.new.to(10_000)
    expected = 0
    assert_equal expected, actual
  end

  def test_the_only_multiple_of_0_is_0
    skip
    actual = SumOfMultiples.new(0).to(1)
    expected = 0
    assert_equal expected, actual
  end

  def test_solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3
    skip
    actual = SumOfMultiples.new(2, 3, 5, 7, 11).to(10_000)
    expected = 39_614_537
    assert_equal expected, actual
  end
end

require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_smallest_perfect_number_is_classified_correctly
    # skip
    assert_equal 'perfect', PerfectNumber.classify(6)
  end

  def test_medium_perfect_number_is_classified_correctly
    skip
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_large_perfect_number_is_classified_correctly
    skip
    assert_equal 'perfect', PerfectNumber.classify(33_550_336)
  end

  def test_smallest_abundant_number_is_classified_correctly
    skip
    assert_equal 'abundant', PerfectNumber.classify(12)
  end

  def test_medium_abundant_number_is_classified_correctly
    skip
    assert_equal 'abundant', PerfectNumber.classify(30)
  end

  def test_large_abundant_number_is_classified_correctly
    skip
    assert_equal 'abundant', PerfectNumber.classify(33_550_335)
  end

  def test_smallest_prime_deficient_number_is_classified_correctly
    skip
    assert_equal 'deficient', PerfectNumber.classify(2)
  end

  def test_smallest_non_prime_deficient_number_is_classified_correctly
    skip
    assert_equal 'deficient', PerfectNumber.classify(4)
  end

  def test_medium_deficient_number_is_classified_correctly
    skip
    assert_equal 'deficient', PerfectNumber.classify(32)
  end

  def test_large_deficient_number_is_classified_correctly
    skip
    assert_equal 'deficient', PerfectNumber.classify(33_550_337)
  end

  def test_edge_case_no_factors_other_than_itself_is_classified_correctly
    skip
    assert_equal 'deficient', PerfectNumber.classify(1)
  end

  def test_zero_is_rejected_as_it_is_not_a_positive_integer
    skip
    error = assert_raises(ArgumentError) { PerfectNumber.classify(0) }
    assert_equal 'Classification is only possible for positive integers.', error.message
  end

  def test_negative_integer_is_rejected_as_it_is_not_a_positive_integer
    skip
    error = assert_raises(ArgumentError) { PerfectNumber.classify(-1) }
    assert_equal 'Classification is only possible for positive integers.', error.message
  end
end

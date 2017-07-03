require 'minitest/autorun'
require_relative 'largest_series_product'

# Common test data version: 1.0.0 e79b832
class LargestSeriesProductTest < Minitest::Test
  def test_finds_the_largest_product_if_span_equals_length
    # skip
    assert_equal 18, Series.new('29').largest_product(2)
  end

  def test_can_find_the_largest_product_of_2_with_numbers_in_order
    skip
    assert_equal 72, Series.new('0123456789').largest_product(2)
  end

  def test_can_find_the_largest_product_of_2
    skip
    assert_equal 48, Series.new('576802143').largest_product(2)
  end

  def test_can_find_the_largest_product_of_3_with_numbers_in_order
    skip
    assert_equal 504, Series.new('0123456789').largest_product(3)
  end

  def test_can_find_the_largest_product_of_3
    skip
    assert_equal 270, Series.new('1027839564').largest_product(3)
  end

  def test_can_find_the_largest_product_of_5_with_numbers_in_order
    skip
    assert_equal 15120, Series.new('0123456789').largest_product(5)
  end

  def test_can_get_the_largest_product_of_a_big_number
    skip
    assert_equal 23520, Series.new('73167176531330624919225119674426574742355349194934').largest_product(6)
  end

  def test_reports_zero_if_the_only_digits_are_zero
    skip
    assert_equal 0, Series.new('0000').largest_product(2)
  end

  def test_reports_zero_if_all_spans_include_zero
    skip
    assert_equal 0, Series.new('99099').largest_product(3)
  end

  def test_rejects_span_longer_than_string_length
    skip
    assert_raises(ArgumentError) { Series.new('123').largest_product(4) }
  end

  def test_reports_1_for_empty_string_and_empty_product_0_span
    skip
    assert_equal 1, Series.new('').largest_product(0)
  end

  def test_reports_1_for_nonempty_string_and_empty_product_0_span
    skip
    assert_equal 1, Series.new('123').largest_product(0)
  end

  def test_rejects_empty_string_and_nonzero_span
    skip
    assert_raises(ArgumentError) { Series.new('').largest_product(1) }
  end

  def test_rejects_invalid_character_in_digits
    skip
    assert_raises(ArgumentError) { Series.new('1234a5').largest_product(2) }
  end

  def test_rejects_negative_span
    skip
    assert_raises(ArgumentError) { Series.new('12345').largest_product(-1) }
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 3, BookKeeping::VERSION
  end
end

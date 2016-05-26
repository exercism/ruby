#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'largest_series_product'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

# Rubocop directives
# rubocop:disable Style/NumericLiterals
# rubocop:disable Metrics/LineLength
#
class Seriestest < Minitest::Test
  def test_can_find_the_largest_product_of_2_with_numbers_in_order
    assert_equal 72, Series.new('0123456789').largest_product(2)
  end

  def test_can_find_the_largest_product_of_2
    skip
    assert_equal 48, Series.new('576802143').largest_product(2)
  end

  def test_finds_the_largest_product_if_span_equals_length
    skip
    assert_equal 18, Series.new('29').largest_product(2)
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

  def test_can_get_the_largest_product_of_a_big_number_ii
    skip
    assert_equal 28350, Series.new('52677741234314237566414902593461595376319419139427').largest_product(6)
  end

  def test_can_get_the_largest_product_of_a_big_number_project_euler
    skip
    assert_equal 23514624000, Series.new('7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450').largest_product(13)
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
  # module.
  #  In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    assert_equal 2, BookKeeping::VERSION
  end
end

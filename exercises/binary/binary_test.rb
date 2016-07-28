#!/usr/bin/env ruby
# encoding: utf-8
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'binary'

# Test data version:
# 01092b0
class BinaryTest < Minitest::Test
  def test_binary_0_is_decimal_0
    # skip
    assert_equal 0, Binary.new('0').to_decimal
  end

  def test_binary_1_is_decimal_1
    skip
    assert_equal 1, Binary.new('1').to_decimal
  end

  def test_binary_10_is_decimal_2
    skip
    assert_equal 2, Binary.new('10').to_decimal
  end

  def test_binary_11_is_decimal_3
    skip
    assert_equal 3, Binary.new('11').to_decimal
  end

  def test_binary_100_is_decimal_4
    skip
    assert_equal 4, Binary.new('100').to_decimal
  end

  def test_binary_1001_is_decimal_9
    skip
    assert_equal 9, Binary.new('1001').to_decimal
  end

  def test_binary_11010_is_decimal_26
    skip
    assert_equal 26, Binary.new('11010').to_decimal
  end

  def test_binary_10001101000_is_decimal_1128
    skip
    assert_equal 1128, Binary.new('10001101000').to_decimal
  end

  def test_binary_ignores_leading_zeros
    skip
    assert_equal 31, Binary.new('000011111').to_decimal
  end

  def test_2_is_not_a_valid_binary_digit
    skip
    assert_raises(ArgumentError) { Binary.new('2') }
  end

  def test_a_number_containing_a_non_binary_digit_is_invalid
    skip
    assert_raises(ArgumentError) { Binary.new('01201') }
  end

  def test_a_number_with_trailing_non_binary_characters_is_invalid
    skip
    assert_raises(ArgumentError) { Binary.new('10nope') }
  end

  def test_a_number_with_leading_non_binary_characters_is_invalid
    skip
    assert_raises(ArgumentError) { Binary.new('nope10') }
  end

  def test_a_number_with_internal_non_binary_characters_is_invalid
    skip
    assert_raises(ArgumentError) { Binary.new('10nope10') }
  end

  def test_a_number_and_a_word_whitespace_spearated_is_invalid
    skip
    assert_raises(ArgumentError) { Binary.new('001 nope') }
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
    assert_equal 2, BookKeeping::VERSION
  end
end

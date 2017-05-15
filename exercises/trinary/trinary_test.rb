#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'trinary'

class TrinaryTest < Minitest::Test
  def test_trinary_1_is_decimal_1
    assert_equal 1, Trinary.new('1').to_decimal
  end

  def test_trinary_2_is_decimal_2
    skip
    assert_equal 2, Trinary.new('2').to_decimal
  end

  def test_trinary_10_is_decimal_3
    skip
    assert_equal 3, Trinary.new('10').to_decimal
  end

  def test_trinary_11_is_decimal_4
    skip
    assert_equal 4, Trinary.new('11').to_decimal
  end

  def test_trinary_100_is_decimal_9
    skip
    assert_equal 9, Trinary.new('100').to_decimal
  end

  def test_trinary_112_is_decimal_14
    skip
    assert_equal 14, Trinary.new('112').to_decimal
  end

  def test_trinary_222_is_26
    skip
    assert_equal 26, Trinary.new('222').to_decimal
  end

  def test_trinary_1122000120_is_32091
    skip
    assert_equal 32_091, Trinary.new('1122000120').to_decimal
  end

  def test_invalid_trinary_is_decimal_0
    skip
    assert_equal 0, Trinary.new('carrot').to_decimal
  end

  def test_invalid_trinary_with_digits_is_decimal_0
    skip
    assert_equal 0, Trinary.new('0a1b2c').to_decimal
  end

  def test_invalid_trinary_with_multiline_string
    skip
    assert_equal 0, Trinary.new("Invalid\n201\nString").to_decimal
  end

  def test_number_out_of_range
    skip
    assert_equal 0, Trinary.new('4').to_decimal
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
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.htm
  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end

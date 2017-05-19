#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'phone_number'

# Common test data version: 1.2.0 39cba0d
class PhoneNumberTest < Minitest::Test
  def test_cleans_the_number
    # skip
    assert_equal "2234567890", PhoneNumber.clean("(223) 456-7890")
  end

  def test_cleans_numbers_with_dots
    skip
    assert_equal "2234567890", PhoneNumber.clean("223.456.7890")
  end

  def test_cleans_numbers_with_multiple_spaces
    skip
    assert_equal "2234567890", PhoneNumber.clean("223 456   7890   ")
  end

  def test_invalid_when_9_digits
    skip
    assert_nil PhoneNumber.clean("123456789")
  end

  def test_invalid_when_11_digits_does_not_start_with_a_1
    skip
    assert_nil PhoneNumber.clean("22234567890")
  end

  def test_valid_when_11_digits_and_starting_with_1
    skip
    assert_equal "2234567890", PhoneNumber.clean("12234567890")
  end

  def test_valid_when_11_digits_and_starting_with_1_even_with_punctuation
    skip
    assert_equal "2234567890", PhoneNumber.clean("+1 (223) 456-7890")
  end

  def test_invalid_when_more_than_11_digits
    skip
    assert_nil PhoneNumber.clean("321234567890")
  end

  def test_invalid_with_letters
    skip
    assert_nil PhoneNumber.clean("123-abc-7890")
  end

  def test_invalid_with_punctuations
    skip
    assert_nil PhoneNumber.clean("123-@:!-7890")
  end

  def test_invalid_if_area_code_does_not_start_with_2_9
    skip
    assert_nil PhoneNumber.clean("(123) 456-7890")
  end

  def test_invalid_if_exchange_code_does_not_start_with_2_9
    skip
    assert_nil PhoneNumber.clean("(223) 056-7890")
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

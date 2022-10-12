require 'minitest/autorun'
require_relative 'phone_number'

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
    assert_nil PhoneNumber.clean("523-abc-7890")
  end

  def test_invalid_with_punctuations
    skip
    assert_nil PhoneNumber.clean("523-@:!-7890")
  end

  def test_invalid_if_area_code_starts_with_0
    skip
    assert_nil PhoneNumber.clean("(023) 456-7890")
  end

  def test_invalid_if_area_code_starts_with_1
    skip
    assert_nil PhoneNumber.clean("(123) 456-7890")
  end

  def test_invalid_if_exchange_code_starts_with_0
    skip
    assert_nil PhoneNumber.clean("(223) 056-7890")
  end

  def test_invalid_if_exchange_code_starts_with_1
    skip
    assert_nil PhoneNumber.clean("(223) 156-7890")
  end

  def test_invalid_if_area_code_starts_with_0_on_valid_11_digit_number
    skip
    assert_nil PhoneNumber.clean("1 (023) 456-7890")
  end

  def test_invalid_if_area_code_starts_with_1_on_valid_11_digit_number
    skip
    assert_nil PhoneNumber.clean("1 (123) 456-7890")
  end

  def test_invalid_if_exchange_code_starts_with_0_on_valid_11_digit_number
    skip
    assert_nil PhoneNumber.clean("1 (223) 056-7890")
  end

  def test_invalid_if_exchange_code_starts_with_1_on_valid_11_digit_number
    skip
    assert_nil PhoneNumber.clean("1 (223) 156-7890")
  end
end

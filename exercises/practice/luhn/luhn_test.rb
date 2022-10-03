require 'minitest/autorun'
require_relative 'luhn'

# Common test data version: 1.4.0 4a80663
class LuhnTest < Minitest::Test
  def test_single_digit_strings_can_not_be_valid
    # skip
    refute Luhn.valid?("1")
  end

  def test_a_single_zero_is_invalid
    skip
    refute Luhn.valid?("0")
  end

  def test_a_simple_valid_sin_that_remains_valid_if_reversed
    skip
    assert Luhn.valid?("059")
  end

  def test_a_simple_valid_sin_that_becomes_invalid_if_reversed
    skip
    assert Luhn.valid?("59")
  end

  def test_a_valid_canadian_sin
    skip
    assert Luhn.valid?("055 444 285")
  end

  def test_invalid_canadian_sin
    skip
    refute Luhn.valid?("055 444 286")
  end

  def test_invalid_credit_card
    skip
    refute Luhn.valid?("8273 1232 7352 0569")
  end

  def test_valid_number_with_an_even_number_of_digits
    skip
    assert Luhn.valid?("095 245 88")
  end

  def test_valid_strings_with_a_non_digit_included_become_invalid
    skip
    refute Luhn.valid?("055a 444 285")
  end

  def test_valid_strings_with_a_non_digit_added_at_the_end_become_invalid
    skip
    refute Luhn.valid?("059a")
  end

  def test_valid_strings_with_punctuation_included_become_invalid
    skip
    refute Luhn.valid?("055-444-285")
  end

  def test_valid_strings_with_symbols_included_become_invalid
    skip
    refute Luhn.valid?("055£ 444$ 285")
  end

  def test_single_zero_with_space_is_invalid
    skip
    refute Luhn.valid?(" 0")
  end

  def test_more_than_a_single_zero_is_valid
    skip
    assert Luhn.valid?("0000 0")
  end

  def test_input_digit_9_is_correctly_converted_to_output_digit_9
    skip
    assert Luhn.valid?("091")
  end

  def test_strings_with_non_digits_is_invalid
    skip
    refute Luhn.valid?(":9")
  end
end

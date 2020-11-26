require 'minitest/autorun'
require_relative 'armstrong_numbers'

# Common test data version: 1.1.0 b3c2522
class ArmstrongNumbersTest < Minitest::Test
  def test_zero_is_an_armstrong_number
    assert ArmstrongNumbers.include?(0)
  end

  def test_single_digit_numbers_are_armstrong_numbers
    assert ArmstrongNumbers.include?(5)
  end

  def test_there_are_no_2_digit_armstrong_numbers
    refute ArmstrongNumbers.include?(10)
  end

  def test_three_digit_number_that_is_an_armstrong_number
    assert ArmstrongNumbers.include?(153)
  end

  def test_three_digit_number_that_is_not_an_armstrong_number
    refute ArmstrongNumbers.include?(100)
  end

  def test_four_digit_number_that_is_an_armstrong_number
    assert ArmstrongNumbers.include?(9_474)
  end

  def test_four_digit_number_that_is_not_an_armstrong_number
    refute ArmstrongNumbers.include?(9_475)
  end

  def test_seven_digit_number_that_is_an_armstrong_number
    assert ArmstrongNumbers.include?(9_926_315)
  end

  def test_seven_digit_number_that_is_not_an_armstrong_number
    refute ArmstrongNumbers.include?(9_926_314)
  end
end

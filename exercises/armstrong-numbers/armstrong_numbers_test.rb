require 'minitest/autorun'
require_relative 'armstrong_number'

class ArmstrongNumbersTest < Minitest::Test
  def test_one_digit_numbers_are_armstrong_numbers
    assert ArmstrongNumber.is_valid?(1)
    assert ArmstrongNumber.is_valid?(6)
    assert ArmstrongNumber.is_valid?(9)
  end

  def test_two_digit_numbers_aren_t_armstrong_numbers
    refute ArmstrongNumber.is_valid?(11)
    refute ArmstrongNumber.is_valid?(89)
    refute ArmstrongNumber.is_valid?(44)
  end

  def test_three_digit_numbers_that_are_the_armstrong_numbers
    assert ArmstrongNumber.is_valid?(153)
    assert ArmstrongNumber.is_valid?(370)
  end

  def test_three_digit_numbers_that_aren_t_the_armstrong_numbers
    refute ArmstrongNumber.is_valid?(555)
    refute ArmstrongNumber.is_valid?(662)
  end

  def test_four_digit_number_that_is_the_armstrong_numbers
    assert ArmstrongNumber.is_valid?(1634)
  end

  def test_four_digit_number_that_is_not_the_armstrong_numbers
    refute ArmstrongNumber.is_valid?(9989)
  end

  def test_seven_digit_number_that_is_the_armstrong_numbers
    assert ArmstrongNumber.is_valid?(9926315)
  end

  def test_seven_digit_number_that_is_not_the_armstrong_numbers
    refute ArmstrongNumber.is_valid?(2369989)
  end

  def test_ten_digit_number_that_is_the_armstrong_numbers
    assert ArmstrongNumber.is_valid?(4679307774)
  end

  def test_fourteen_digit_number_that_is_the_armstrong_numbers
    assert ArmstrongNumber.is_valid?(28116440335967)
  end
end

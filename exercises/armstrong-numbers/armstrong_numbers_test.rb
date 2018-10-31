require 'minitest/autorun'
require_relative 'armstrong_numbers'

class ArmstrongNumbersTest < Minitest::Test
  def test_one_digit_numbers_are_armstrong_numbers
    assert ArmstrongNumbers.is_valid?(1)
    assert ArmstrongNumbers.is_valid?(6)
    assert ArmstrongNumbers.is_valid?(9)
  end

  def test_two_digit_numbers_aren_t_armstrong_numbers
    skip
    refute ArmstrongNumbers.is_valid?(11)
    refute ArmstrongNumbers.is_valid?(89)
    refute ArmstrongNumbers.is_valid?(44)
  end

  def test_three_digit_numbers_that_are_armstrong_numbers
    skip
    assert ArmstrongNumbers.is_valid?(153)
    assert ArmstrongNumbers.is_valid?(370)
  end

  def test_three_digit_numbers_that_aren_t_armstrong_numbers
    skip
    refute ArmstrongNumbers.is_valid?(555)
    refute ArmstrongNumbers.is_valid?(662)
  end

  def test_four_digit_number_that_is_armstrong_number
    skip
    assert ArmstrongNumbers.is_valid?(1_634)
  end

  def test_four_digit_number_that_is_not_armstrong_number
    skip
    refute ArmstrongNumbers.is_valid?(9_989)
  end

  def test_seven_digit_number_that_is_armstrong_number
    skip
    assert ArmstrongNumbers.is_valid?(9_926_315)
  end

  def test_seven_digit_number_that_is_not_armstrong_number
    skip
    refute ArmstrongNumbers.is_valid?(2_369_989)
  end

  def test_ten_digit_number_that_is_armstrong_number
    skip
    assert ArmstrongNumbers.is_valid?(4_679_307_774)
  end

  def test_fourteen_digit_number_that_is_armstrong_number
    skip
    assert ArmstrongNumbers.is_valid?(28_116_440_335_967)
  end
end

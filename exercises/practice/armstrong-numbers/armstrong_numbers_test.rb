require 'minitest/autorun'
require_relative 'armstrong_numbers'

class ArmstrongNumbersTest < Minitest::Test
  def test_zero_is_an_armstrong_number
    # skip
    assert_includes ArmstrongNumbers, 0
  end

  def test_single_digit_numbers_are_armstrong_numbers
    skip
    assert_includes ArmstrongNumbers, 5
  end

  def test_there_are_no_two_digit_armstrong_numbers
    skip
    refute_includes ArmstrongNumbers, 10
  end

  def test_three_digit_number_that_is_an_armstrong_number
    skip
    assert_includes ArmstrongNumbers, 153
  end

  def test_three_digit_number_that_is_not_an_armstrong_number
    skip
    refute_includes ArmstrongNumbers, 100
  end

  def test_four_digit_number_that_is_an_armstrong_number
    skip
    assert_includes ArmstrongNumbers, 9474
  end

  def test_four_digit_number_that_is_not_an_armstrong_number
    skip
    refute_includes ArmstrongNumbers, 9475
  end

  def test_seven_digit_number_that_is_an_armstrong_number
    skip
    assert_includes ArmstrongNumbers, 9_926_315
  end

  def test_seven_digit_number_that_is_not_an_armstrong_number
    skip
    refute_includes ArmstrongNumbers, 9_926_314
  end

  def test_armstrong_number_containing_seven_zeroes
    skip
    assert_includes ArmstrongNumbers, 186_709_961_001_538_790_100_634_132_976_990
  end

  def test_the_largest_and_last_armstrong_number
    skip
    assert_includes ArmstrongNumbers, 115_132_219_018_763_992_565_095_597_973_971_522_401
  end
end

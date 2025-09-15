require 'minitest/autorun'
require_relative 'leap'

class Date
  def leap?
    raise "Write this functionality yourself instead of using Ruby's `leap?` method."
  end

  alias gregorian_leap? leap?
  alias julian_leap? leap?
end

class YearTest < Minitest::Test
  def test_year_not_divisible_by_4_in_common_year
    # skip
    refute Year.leap?(2015), "Expected 'false', 2015 is not a leap year"
  end

  def test_year_divisible_by_2_not_divisible_by_4_in_common_year
    skip
    refute Year.leap?(1970), "Expected 'false', 1970 is not a leap year"
  end

  def test_year_divisible_by_4_not_divisible_by_100_in_leap_year
    skip
    assert Year.leap?(1996), "Expected 'true', 1996 is a leap year"
  end

  def test_year_divisible_by_4_and_5_is_still_a_leap_year
    skip
    assert Year.leap?(1960), "Expected 'true', 1960 is a leap year"
  end

  def test_year_divisible_by_100_not_divisible_by_400_in_common_year
    skip
    refute Year.leap?(2100), "Expected 'false', 2100 is not a leap year"
  end

  def test_year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year
    skip
    refute Year.leap?(1900), "Expected 'false', 1900 is not a leap year"
  end

  def test_year_divisible_by_400_is_leap_year
    skip
    assert Year.leap?(2000), "Expected 'true', 2000 is a leap year"
  end

  def test_year_divisible_by_400_but_not_by_125_is_still_a_leap_year
    skip
    assert Year.leap?(2400), "Expected 'true', 2400 is a leap year"
  end

  def test_year_divisible_by_200_not_divisible_by_400_in_common_year
    skip
    refute Year.leap?(1800), "Expected 'false', 1800 is not a leap year"
  end
end

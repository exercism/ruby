require 'minitest/autorun'
require_relative 'leap'

# Common test data version: 1.1.0 7f4d0d8
class Date
  def leap?
    raise RuntimeError, "Implement this yourself instead of using Ruby's implementation."
  end

  alias gregorian_leap? leap?
  alias julian_leap? leap?
end

class YearTest < Minitest::Test
  def test_year_not_divisible_by_4_common_year
    # skip
    refute Year.leap?(2015), "Expected 'false', 2015 is not a leap year."
  end

  def test_year_divisible_by_4_not_divisible_by_100_leap_year
    skip
    assert Year.leap?(2020), "Expected 'true', 2020 is a leap year."
  end

  def test_year_divisible_by_100_not_divisible_by_400_common_year
    skip
    refute Year.leap?(2100), "Expected 'false', 2100 is not a leap year."
  end

  def test_year_divisible_by_400_leap_year
    skip
    assert Year.leap?(2000), "Expected 'true', 2000 is a leap year."
  end
end

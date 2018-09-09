require 'minitest/autorun'
require_relative 'gigasecond'

# Common test data version: 1.1.0 5506bac
class GigasecondTest < Minitest::Test
  def test_date_only_specification_of_time
    # skip
    assert_equal Time.utc(2043, 1, 1, 1, 46, 40), Gigasecond.from(Time.utc(2011, 4, 25, 0, 0, 0))
  end

  def test_second_test_for_date_only_specification_of_time
    skip
    assert_equal Time.utc(2009, 2, 19, 1, 46, 40), Gigasecond.from(Time.utc(1977, 6, 13, 0, 0, 0))
  end

  def test_third_test_for_date_only_specification_of_time
    skip
    assert_equal Time.utc(1991, 3, 27, 1, 46, 40), Gigasecond.from(Time.utc(1959, 7, 19, 0, 0, 0))
  end

  def test_full_time_specified
    skip
    assert_equal Time.utc(2046, 10, 2, 23, 46, 40), Gigasecond.from(Time.utc(2015, 1, 24, 22, 0, 0))
  end

  def test_full_time_with_day_roll_over
    skip
    assert_equal Time.utc(2046, 10, 3, 1, 46, 39), Gigasecond.from(Time.utc(2015, 1, 24, 23, 59, 59))
  end
end

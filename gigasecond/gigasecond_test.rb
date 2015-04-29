require 'minitest/autorun'
require 'date'
require 'time'

require_relative 'gigasecond'
class GigasecondTest < Minitest::Test

  def test_2011_04_25
    gs = Gigasecond.from(Time.utc(2011, 4, 25, 0, 0, 0))
    assert_equal Time.utc(2043, 1, 1, 1, 46, 40), gs
  end

  def test_1977_06_13
    skip
    gs = Gigasecond.from(Time.utc(1977, 6, 13, 0, 0, 0))
    assert_equal Time.utc(2009, 2, 19, 1, 46, 40), gs
  end

  def test_1959_07_19
    skip
    gs = Gigasecond.from(Time.utc(1959, 7, 19, 0, 0, 0))
    assert_equal Time.utc(1991, 3, 27, 1, 46, 40), gs
  end

  def test_full_time_specified
    skip
    gs = Gigasecond.from(Time.utc(2015, 1, 24, 22, 0, 0))
    assert_equal Time.utc(2046, 10, 2, 23, 46, 40), gs
  end

  def test_full_time_with_day_roll_over
    skip
    gs = Gigasecond.from(Time.utc(2015, 1, 24, 23, 59, 59))
    assert_equal Time.utc(2046, 10, 3, 1, 46, 39), gs
  end

  #modify the test to test your 1 Gs anniversary
  def test_with_your_birthday
    skip("Keep")
    your_birthday = Time.utc(year, month, day)
    gs = Gigasecond.from(your_birthday)
    assert_equal Time.utc(2009, 1, 31, 1, 46, 39), gs
  end
end

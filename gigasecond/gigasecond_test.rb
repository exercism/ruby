require 'minitest/autorun'
require 'date'
require 'time'

require_relative 'gigasecond'
class GigasecondTest < Minitest::Test
  def test_1
    gs = Gigasecond.from(Time.utc(2011, 4, 25))
    assert_equal Time.utc(2043, 1, 1, 1, 46, 40), gs
  end

  def test_2
    skip
    gs = Gigasecond.from(Time.utc(1977, 6, 13))
    assert_equal Time.utc(2009, 2, 19, 1, 46, 40), gs
  end

  def test_3
    skip
    gs = Gigasecond.from(Time.utc(1959, 7, 19))
    assert_equal Time.utc(1991, 3, 27, 1, 46, 40), gs
  end

  def test_4_with_seconds
    skip
    gs = Gigasecond.from(Time.utc(1959, 7, 19, 23, 59, 59))
    assert_equal Time.utc(1991, 3, 28, 1, 46, 39), gs
  end

  # modify the test to test your 1 Gs anniversary
  def test_5_with_your_birthday
    skip("Keep")
    your_birthday = Time.utc(year, month, day)
    gs = Gigasecond.from(your_birthday)
    assert_equal Time.utc(2009, 1, 31, 1, 46, 39), gs
  end
end

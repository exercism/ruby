require 'minitest/autorun'
require 'date'
require 'time'

require_relative 'gigasecond'
class GigasecondTest < Minitest::Unit::TestCase
  def test_1_winter_time
    gs = Gigasecond.from(Time.new(2011, 4, 25))
    assert_equal Time.new(2043, 1, 1, 0 , 46, 40), gs
  end

  def test_2_winter_time
    skip
    gs = Gigasecond.from(Time.new(1977, 6, 13))
    assert_equal Time.new(2009, 2, 19, 0, 46, 40), gs
  end

  def test_3_summer_time
    skip
    gs = Gigasecond.from(Time.new(1959, 7, 19))
    assert_equal Time.new(1991, 3, 27, 0, 46, 40), gs
  end

  def test_4_summer_time_with_seconds
    skip
    gs = Gigasecond.from(Time.new(1959, 7, 19, 23, 59, 59))
    assert_equal Time.new(1991, 3, 28, 0, 46, 39), gs
  end

  # modify the test to test your 1 Gs anniversary
  def test_5_with_your_birthday
    skip
    your_birthday = Time.new(year, month, day)
    gs = Gigasecond.from(your_birthday)
    assert_equal Time.new(2009, 1, 31), gs
  end
end

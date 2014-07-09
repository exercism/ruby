require 'minitest/autorun'
require 'date'
require 'time'
require_relative 'gigasecond'

class GigasecondTest < MiniTest::Unit::TestCase
  # These tests were revised around July 2014. If your solution was
  # created before that revision, you can solve it by using the following
  # code:
  #
  # def Gigasecond.from(start_date)
  #   Gigasecond.new(start_date).date
  # end
  #
  # Keep in mind that that code is a workaround to get your tests working
  # and does not necessarily provide the cleanest solution to the test as
  # it is now.

  def test_1
    test_date = Date.new(2011, 4, 25)
    assert_equal Date.new(2043, 1, 1), Gigasecond.from(test_date)
  end

  def test_2
    skip
    test_date = Date.new(1977, 6, 13)
    assert_equal Date.new(2009, 2, 19), Gigasecond.from(test_date)
  end

  def test_3
    skip
    test_date = Date.new(1959, 7, 19)
    assert_equal Date.new(1991, 3, 27), Gigasecond.from(test_date)
  end

  def test_yourself
    skip
    your_birthday = Date.new(year, month, day)
    assert_equal Date.new(2009, 1, 31), Gigasecond.from(your_birthday)
  end

end

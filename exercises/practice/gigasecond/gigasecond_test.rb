require 'minitest/autorun'
require_relative 'gigasecond'
require 'time'

class GigasecondTest < Minitest::Test
  def test_date_only_specification_of_time
    # skip
    assert_equal Time.parse('2043-01-01T01:46:40 UTC'), Gigasecond.from(Time.parse('2011-04-25T00:00:00 UTC'))
  end

  def test_second_test_for_date_only_specification_of_time
    skip
    assert_equal Time.parse('2009-02-19T01:46:40 UTC'), Gigasecond.from(Time.parse('1977-06-13T00:00:00 UTC'))
  end

  def test_third_test_for_date_only_specification_of_time
    skip
    assert_equal Time.parse('1991-03-27T01:46:40 UTC'), Gigasecond.from(Time.parse('1959-07-19T00:00:00 UTC'))
  end

  def test_full_time_specified
    skip
    assert_equal Time.parse('2046-10-02T23:46:40 UTC'), Gigasecond.from(Time.parse('2015-01-24T22:00:00 UTC'))
  end

  def test_full_time_with_day_roll_over
    skip
    assert_equal Time.parse('2046-10-03T01:46:39 UTC'), Gigasecond.from(Time.parse('2015-01-24T23:59:59 UTC'))
  end
end

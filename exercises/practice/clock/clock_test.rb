require 'minitest/autorun'
require_relative 'clock'

# Common test data version: 2.4.0 b344762
class ClockTest < Minitest::Test
  def test_on_the_hour
    # skip
    assert_equal "08:00", Clock.new(hour: 8).to_s
  end

  def test_past_the_hour
    skip
    assert_equal "11:09", Clock.new(hour: 11, minute: 9).to_s
  end

  def test_midnight_is_zero_hours
    skip
    assert_equal "00:00", Clock.new(hour: 24).to_s
  end

  def test_hour_rolls_over
    skip
    assert_equal "01:00", Clock.new(hour: 25).to_s
  end

  def test_hour_rolls_over_continuously
    skip
    assert_equal "04:00", Clock.new(hour: 100).to_s
  end

  def test_sixty_minutes_is_next_hour
    skip
    assert_equal "02:00", Clock.new(hour: 1, minute: 60).to_s
  end

  def test_minutes_roll_over
    skip
    assert_equal "02:40", Clock.new(minute: 160).to_s
  end

  def test_minutes_roll_over_continuously
    skip
    assert_equal "04:43", Clock.new(minute: 1723).to_s
  end

  def test_hour_and_minutes_roll_over
    skip
    assert_equal "03:40", Clock.new(hour: 25, minute: 160).to_s
  end

  def test_hour_and_minutes_roll_over_continuously
    skip
    assert_equal "11:01", Clock.new(hour: 201, minute: 3001).to_s
  end

  def test_hour_and_minutes_roll_over_to_exactly_midnight
    skip
    assert_equal "00:00", Clock.new(hour: 72, minute: 8640).to_s
  end

  def test_negative_hour
    skip
    assert_equal "23:15", Clock.new(hour: -1, minute: 15).to_s
  end

  def test_negative_hour_rolls_over
    skip
    assert_equal "23:00", Clock.new(hour: -25).to_s
  end

  def test_negative_hour_rolls_over_continuously
    skip
    assert_equal "05:00", Clock.new(hour: -91).to_s
  end

  def test_negative_minutes
    skip
    assert_equal "00:20", Clock.new(hour: 1, minute: -40).to_s
  end

  def test_negative_minutes_roll_over
    skip
    assert_equal "22:20", Clock.new(hour: 1, minute: -160).to_s
  end

  def test_negative_minutes_roll_over_continuously
    skip
    assert_equal "16:40", Clock.new(hour: 1, minute: -4820).to_s
  end

  def test_negative_sixty_minutes_is_previous_hour
    skip
    assert_equal "01:00", Clock.new(hour: 2, minute: -60).to_s
  end

  def test_negative_hour_and_minutes_both_roll_over
    skip
    assert_equal "20:20", Clock.new(hour: -25, minute: -160).to_s
  end

  def test_negative_hour_and_minutes_both_roll_over_continuously
    skip
    assert_equal "22:10", Clock.new(hour: -121, minute: -5810).to_s
  end

  def test_add_minutes
    skip
    clock1 = Clock.new(hour: 10, minute: 0)
    assert_equal "10:03", (clock1 + Clock.new(minute: 3)).to_s
  end

  def test_add_no_minutes
    skip
    clock1 = Clock.new(hour: 6, minute: 41)
    assert_equal "06:41", (clock1 + Clock.new(minute: 0)).to_s
  end

  def test_add_to_next_hour
    skip
    clock1 = Clock.new(hour: 0, minute: 45)
    assert_equal "01:25", (clock1 + Clock.new(minute: 40)).to_s
  end

  def test_add_more_than_one_hour
    skip
    clock1 = Clock.new(hour: 10, minute: 0)
    assert_equal "11:01", (clock1 + Clock.new(minute: 61)).to_s
  end

  def test_add_more_than_two_hours_with_carry
    skip
    clock1 = Clock.new(hour: 0, minute: 45)
    assert_equal "03:25", (clock1 + Clock.new(minute: 160)).to_s
  end

  def test_add_across_midnight
    skip
    clock1 = Clock.new(hour: 23, minute: 59)
    assert_equal "00:01", (clock1 + Clock.new(minute: 2)).to_s
  end

  def test_add_more_than_one_day
    skip
    clock1 = Clock.new(hour: 5, minute: 32)
    assert_equal "06:32", (clock1 + Clock.new(minute: 1500)).to_s
  end

  def test_add_more_than_two_days
    skip
    clock1 = Clock.new(hour: 1, minute: 1)
    assert_equal "11:21", (clock1 + Clock.new(minute: 3500)).to_s
  end

  def test_subtract_minutes
    skip
    clock1 = Clock.new(hour: 10, minute: 3)
    assert_equal "10:00", (clock1 - Clock.new(minute: 3)).to_s
  end

  def test_subtract_to_previous_hour
    skip
    clock1 = Clock.new(hour: 10, minute: 3)
    assert_equal "09:33", (clock1 - Clock.new(minute: 30)).to_s
  end

  def test_subtract_more_than_an_hour
    skip
    clock1 = Clock.new(hour: 10, minute: 3)
    assert_equal "08:53", (clock1 - Clock.new(minute: 70)).to_s
  end

  def test_subtract_across_midnight
    skip
    clock1 = Clock.new(hour: 0, minute: 3)
    assert_equal "23:59", (clock1 - Clock.new(minute: 4)).to_s
  end

  def test_subtract_more_than_two_hours
    skip
    clock1 = Clock.new(hour: 0, minute: 0)
    assert_equal "21:20", (clock1 - Clock.new(minute: 160)).to_s
  end

  def test_subtract_more_than_two_hours_with_borrow
    skip
    clock1 = Clock.new(hour: 6, minute: 15)
    assert_equal "03:35", (clock1 - Clock.new(minute: 160)).to_s
  end

  def test_subtract_more_than_one_day
    skip
    clock1 = Clock.new(hour: 5, minute: 32)
    assert_equal "04:32", (clock1 - Clock.new(minute: 1500)).to_s
  end

  def test_subtract_more_than_two_days
    skip
    clock1 = Clock.new(hour: 2, minute: 20)
    assert_equal "00:20", (clock1 - Clock.new(minute: 3000)).to_s
  end

  def test_clocks_with_same_time
    skip
    clock1 = Clock.new(hour: 15, minute: 37)
    clock2 = Clock.new(hour: 15, minute: 37)
    assert clock1 == clock2
  end

  def test_clocks_a_minute_apart
    skip
    clock1 = Clock.new(hour: 15, minute: 36)
    clock2 = Clock.new(hour: 15, minute: 37)
    refute clock1 == clock2
  end

  def test_clocks_an_hour_apart
    skip
    clock1 = Clock.new(hour: 14, minute: 37)
    clock2 = Clock.new(hour: 15, minute: 37)
    refute clock1 == clock2
  end

  def test_clocks_with_hour_overflow
    skip
    clock1 = Clock.new(hour: 10, minute: 37)
    clock2 = Clock.new(hour: 34, minute: 37)
    assert clock1 == clock2
  end

  def test_clocks_with_hour_overflow_by_several_days
    skip
    clock1 = Clock.new(hour: 3, minute: 11)
    clock2 = Clock.new(hour: 99, minute: 11)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour
    skip
    clock1 = Clock.new(hour: 22, minute: 40)
    clock2 = Clock.new(hour: -2, minute: 40)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour_that_wraps
    skip
    clock1 = Clock.new(hour: 17, minute: 3)
    clock2 = Clock.new(hour: -31, minute: 3)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour_that_wraps_multiple_times
    skip
    clock1 = Clock.new(hour: 13, minute: 49)
    clock2 = Clock.new(hour: -83, minute: 49)
    assert clock1 == clock2
  end

  def test_clocks_with_minute_overflow
    skip
    clock1 = Clock.new(hour: 0, minute: 1)
    clock2 = Clock.new(hour: 0, minute: 1441)
    assert clock1 == clock2
  end

  def test_clocks_with_minute_overflow_by_several_days
    skip
    clock1 = Clock.new(hour: 2, minute: 2)
    clock2 = Clock.new(hour: 2, minute: 4322)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute
    skip
    clock1 = Clock.new(hour: 2, minute: 40)
    clock2 = Clock.new(hour: 3, minute: -20)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute_that_wraps
    skip
    clock1 = Clock.new(hour: 4, minute: 10)
    clock2 = Clock.new(hour: 5, minute: -1490)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute_that_wraps_multiple_times
    skip
    clock1 = Clock.new(hour: 6, minute: 15)
    clock2 = Clock.new(hour: 6, minute: -4305)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hours_and_minutes
    skip
    clock1 = Clock.new(hour: 7, minute: 32)
    clock2 = Clock.new(hour: -12, minute: -268)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hours_and_minutes_that_wrap
    skip
    clock1 = Clock.new(hour: 18, minute: 7)
    clock2 = Clock.new(hour: -54, minute: -11513)
    assert clock1 == clock2
  end

  def test_full_clock_and_zeroed_clock
    skip
    clock1 = Clock.new(hour: 24, minute: 0)
    clock2 = Clock.new(hour: 0, minute: 0)
    assert clock1 == clock2
  end
end

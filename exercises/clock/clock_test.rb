#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'clock'

module HelperUnits
  MINUTE = 60
  HOUR = MINUTE * 60
  DAY = HOUR * 24

  def minutes(minutes)
    minutes
  end

  def hours(hours)
    hours * MINUTE
  end

  def days(days)
    days * DAY
  end
end

class ClockTest < Minitest::Test
  include HelperUnits

  def test_on_the_hour
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    skip
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    skip
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_add_over_an_hour
    skip
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    skip
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_subtract_minutes
    skip
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_hour_rolls_over_continuously
    skip
    clock = Clock.at(0) + hours(100)
    assert_equal '04:00', clock.to_s
  end

  def test_minutes_roll_over_continuously
    skip
    clock = Clock.at(0) + minutes(1723)
    assert_equal '04:43', clock.to_s
  end

  def test_hour_and_minutes_roll_over_continuously
    skip
    clock = Clock.at(0) + hours(201) + minutes(3001)
    assert_equal '11:01', clock.to_s
  end

  def test_negative_hours_roll_over_continuously
    skip
    clock = Clock.at(0) - hours(91)
    assert_equal '05:00', clock.to_s
  end

  def test_negative_minutes_roll_over_continuously
    skip
    clock = Clock.at(0) - minutes(4820)
    assert_equal '15:40', clock.to_s
  end

  def test_negative_hours_and_minutes_both_roll_over_continuously
    skip
    clock = Clock.at(0) - hours(121) - minutes(5810)
    assert_equal '22:10', clock.to_s
  end

  def test_add_no_minutes
    skip
    clock = Clock.at(0) + minutes(0)
    assert_equal '00:00', clock.to_s
  end

  def test_add_more_than_two_hours_with_carry
    skip
    clock = Clock.at(0, 45) + minutes(160)
    assert_equal '03:25', clock.to_s
  end

  def test_add_more_than_two_days
    skip
    clock = Clock.at(1, 1) + days(2) + hours(10) + minutes(20)
    assert_equal '11:21', clock.to_s
  end

  def test_subtrackt_more_than_two_hours_with_borrow
    skip
    clock = Clock.at(6, 15) - hours(2) - minutes(40)
    assert_equal '03:35', clock.to_s
  end

  def test_subtract_more_than_two_days
    skip
    clock = Clock.at(2, 20) - days(2) - hours(2)
    assert_equal '00:20', clock.to_s
  end

  def test_equivalent_clocks
    skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    skip
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end
end

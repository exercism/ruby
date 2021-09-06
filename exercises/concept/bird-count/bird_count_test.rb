# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'bird_count'

class BirdCountTest < Minitest::Test
  def test_last_week
    assert_equal [0, 2, 5, 3, 7, 8, 4], BirdCount.last_week
  end

  def test_yesterday_for_disappointing_week
    assert_equal 1, BirdCount.new([0, 0, 1, 0, 0, 1, 0]).yesterday
  end

  def test_yesterday_for_busy_week
    assert_equal 7, BirdCount.new([8, 8, 9, 5, 4, 7, 10]).yesterday
  end

  def test_total_for_disappointing_week
    assert_equal 2, BirdCount.new([0, 0, 1, 0, 0, 1, 0]).total
  end

  def test_total_for_busy_week
    assert_equal 65, BirdCount.new([5, 9, 12, 6, 8, 8, 17]).total
  end

  def test_busy_days_for_dissapointing_week
    assert_equal 0, BirdCount.new([1, 1, 1, 0, 0, 0, 0]).busy_days
  end

  def test_busy_days_for_busy_week
    assert_equal 5, BirdCount.new([4, 9, 5, 7, 8, 8, 2]).busy_days
  end

  def test_has_day_without_birds
    assert BirdCount.new([5, 5, 4, 0, 7, 6]).day_without_birds?
  end

  def test_has_day_without_birds_whith_no_day_without_birds
    refute BirdCount.new([4, 5, 9, 10, 9, 4, 3]).day_without_birds?
  end
end

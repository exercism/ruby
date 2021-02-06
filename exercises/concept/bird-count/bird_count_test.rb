# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'bird_count'

class LasagnaTest < Minitest::Test
  def test_last_week
    assert_equal [0, 2, 5, 3, 7, 8, 4], BirdCount.last_week
  end

  def test_yesterday_for_dissapointing_week
    counts = [0, 0, 1, 0, 0, 1, 0]
    bird_count = BirdCount.new(counts)

    assert_equal 1, bird_count.yesterday
  end

  def test_yesterday_for_busy_week
    counts = [8, 8, 9, 5, 4, 7, 10]
    bird_count = BirdCount.new(counts)

    assert_equal 7, bird_count.yesterday
  end

  def test_total_for_dissapointing_week
    counts = [0, 0, 1, 0, 0, 1, 0]
    bird_count = BirdCount.new(counts)

    assert_equal 2, bird_count.total
  end

  def test_total_for_busy_week
    counts = [5, 9, 12, 6, 8, 8, 17]
    bird_count = BirdCount.new(counts)

    assert_equal 65, bird_count.total
  end

  def test_busy_days_for_dissapointing_week
    counts = [1, 1, 1, 0, 0, 0, 0]
    bird_count = BirdCount.new(counts)

    assert_equal 0, bird_count.busy_days
  end

  def test_busy_days_for_busy_week
    counts = [4, 9, 5, 7, 8, 8, 2]
    bird_count = BirdCount.new(counts)

    assert_equal 5, bird_count.busy_days
  end

  def test_has_day_without_birds
    counts = [5, 5, 4, 0, 7, 6]
    bird_count = BirdCount.new(counts)

    assert bird_count.day_without_birds?
  end

  def test_has_day_without_birds_whith_no_day_without_birds
    counts = [4, 5, 9, 10, 9, 4, 3]
    bird_count = BirdCount.new(counts)

    refute bird_count.day_without_birds?
  end
end


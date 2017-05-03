#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'bowling'

# Common test data version: 1.0.0 3cf5eb9
class BowlingTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def record(rolls)
    rolls.each { |pins| @game.roll(pins) }
  end

  def test_should_be_able_to_score_a_game_with_all_zeros
    # skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 0, @game.score
  end

  def test_should_be_able_to_score_a_game_with_no_strikes_or_spares
    skip
    record([3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6])
    assert_equal 90, @game.score
  end

  def test_a_spare_followed_by_zeros_is_worth_ten_points
    skip
    record([6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 10, @game.score
  end

  def test_points_scored_in_the_roll_after_a_spare_are_counted_twice
    skip
    record([6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 16, @game.score
  end

  def test_consecutive_spares_each_get_a_one_roll_bonus
    skip
    record([5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 31, @game.score
  end

  def test_a_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7])
    assert_equal 17, @game.score
  end

  def test_a_strike_earns_ten_points_in_a_frame_with_a_single_roll
    skip
    record([10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 10, @game.score
  end

  def test_points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus
    skip
    record([10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 26, @game.score
  end

  def test_consecutive_strikes_each_get_the_two_roll_bonus
    skip
    record([10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 81, @game.score
  end

  def test_a_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1])
    assert_equal 18, @game.score
  end

  def test_rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3])
    assert_equal 20, @game.score
  end

  def test_strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10])
    assert_equal 30, @game.score
  end

  def test_a_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10])
    assert_equal 20, @game.score
  end

  def test_all_strikes_is_a_perfect_game
    skip
    record([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    assert_equal 300, @game.score
  end

  def test_rolls_can_not_score_negative_points
    skip
    record([])
    assert_raises Game::BowlingError do
      @game.roll(-1)
    end
  end

  def test_a_roll_can_not_score_more_than_10_points
    skip
    record([])
    assert_raises Game::BowlingError do
      @game.roll(11)
    end
  end

  def test_two_rolls_in_a_frame_can_not_score_more_than_10_points
    skip
    record([5])
    assert_raises Game::BowlingError do
      @game.roll(6)
    end
  end

  def test_bonus_roll_after_a_strike_in_the_last_frame_can_not_score_more_than_10_points
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    assert_raises Game::BowlingError do
      @game.roll(11)
    end
  end

  def test_two_bonus_rolls_after_a_strike_in_the_last_frame_can_not_score_more_than_10_points
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5])
    assert_raises Game::BowlingError do
      @game.roll(6)
    end
  end

  def test_two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6])
    assert_equal 26, @game.score
  end

  def test_the_second_bonus_rolls_after_a_strike_in_the_last_frame_can_not_be_a_strike_if_the_first_one_is_not_a_strike
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6])
    assert_raises Game::BowlingError do
      @game.roll(10)
    end
  end

  def test_second_bonus_roll_after_a_strike_in_the_last_frame_can_not_score_than_10_points
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    assert_raises Game::BowlingError do
      @game.roll(11)
    end
  end

  def test_an_unstarted_game_can_not_be_scored
    skip
    record([])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_an_incomplete_game_can_not_be_scored
    skip
    record([0, 0])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_cannot_roll_if_game_already_has_ten_frames
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_raises Game::BowlingError do
      @game.roll(0)
    end
  end

  def test_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 3, BookKeeping::VERSION
  end
end

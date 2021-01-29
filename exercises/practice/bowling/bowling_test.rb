require 'minitest/autorun'
require_relative 'bowling'

# Common test data version: 1.2.0 1806718
class BowlingTest < Minitest::Test
  def test_should_be_able_to_score_a_game_with_all_zeros
    # skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 0, game.score
  end

  def test_should_be_able_to_score_a_game_with_no_strikes_or_spares
    skip
    game = Game.new
    rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 90, game.score
  end

  def test_a_spare_followed_by_zeros_is_worth_ten_points
    skip
    game = Game.new
    rolls = [6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 10, game.score
  end

  def test_points_scored_in_the_roll_after_a_spare_are_counted_twice
    skip
    game = Game.new
    rolls = [6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 16, game.score
  end

  def test_consecutive_spares_each_get_a_one_roll_bonus
    skip
    game = Game.new
    rolls = [5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 31, game.score
  end

  def test_a_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 17, game.score
  end

  def test_a_strike_earns_ten_points_in_a_frame_with_a_single_roll
    skip
    game = Game.new
    rolls = [10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 10, game.score
  end

  def test_points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus
    skip
    game = Game.new
    rolls = [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 26, game.score
  end

  def test_consecutive_strikes_each_get_the_two_roll_bonus
    skip
    game = Game.new
    rolls = [10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 81, game.score
  end

  def test_a_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 18, game.score
  end

  def test_rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 20, game.score
  end

  def test_strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 30, game.score
  end

  def test_a_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 20, game.score
  end

  def test_all_strikes_is_a_perfect_game
    skip
    game = Game.new
    rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 300, game.score
  end

  def test_rolls_cannot_score_negative_points
    skip
    game = Game.new
    rolls = []
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(-1)
    end
  end

  def test_a_roll_cannot_score_more_than_10_points
    skip
    game = Game.new
    rolls = []
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(11)
    end
  end

  def test_two_rolls_in_a_frame_cannot_score_more_than_10_points
    skip
    game = Game.new
    rolls = [5]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(6)
    end
  end

  def test_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(11)
    end
  end

  def test_two_bonus_rolls_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(6)
    end
  end

  def test_two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6]
    rolls.each { |pins| game.roll(pins) }
    assert_equal 26, game.score
  end

  def test_the_second_bonus_rolls_after_a_strike_in_the_last_frame_cannot_be_a_strike_if_the_first_one_is_not_a_strike
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(10)
    end
  end

  def test_second_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(11)
    end
  end

  def test_an_unstarted_game_cannot_be_scored
    skip
    game = Game.new
    rolls = []
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.score
    end
  end

  def test_an_incomplete_game_cannot_be_scored
    skip
    game = Game.new
    rolls = [0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.score
    end
  end

  def test_cannot_roll_if_game_already_has_ten_frames
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(0)
    end
  end

  def test_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.score
    end
  end

  def test_both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.score
    end
  end

  def test_bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.score
    end
  end

  def test_cannot_roll_after_bonus_roll_for_spare
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(2)
    end
  end

  def test_cannot_roll_after_bonus_rolls_for_strike
    skip
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2]
    rolls.each { |pins| game.roll(pins) }
    assert_raises Game::BowlingError do
      game.roll(2)
    end
  end
end

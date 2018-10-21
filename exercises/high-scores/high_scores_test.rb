require 'minitest/autorun'
require_relative 'high_scores'

# Common test data version: 1.0.0 2f612cc
class HighScoresTest < Minitest::Test
  def test_returns_the_highest_score
    # skip
    assert_equal 10, HighScores.new([4, 10, 7]).highest
  end

  def test_returns_the_last_score
    skip
    assert_equal 3, HighScores.new([10, 0, 9, 3]).latest
  end

  def test_returns_the_top_scores_1
    skip
    assert_equal [5, 3, 1], HighScores.new([5, 3, 1]).top_3
  end

  def test_returns_the_top_scores_2
    skip
    assert_equal [3, 2, 0], HighScores.new([2, 0, 3]).top_3
  end

  def test_returns_the_top_scores_3
    skip
    assert_equal [7, 3], HighScores.new([3, 7]).top_3
  end

  def test_returns_the_top_scores_4
    skip
    assert_equal [4], HighScores.new([4]).top_3
  end

  def test_returns_the_top_3_scores_5
    skip
    assert_equal [10, 9, 7], HighScores.new([1, 3, 9, 3, 10, 2, 1, 0, 3, 4, 4, 7, 7]).top_3
  end

  def test_returns_the_goal_when_not_highest_score
    skip
    assert_equal "Your latest score was 7. That's 3 short of your personal best!", HighScores.new([2, 10, 0, 3, 7]).goal
  end

  def test_returns_the_goal_when_highest_score
    skip
    assert_equal "Your latest score was 7. That's your personal best!", HighScores.new([2, 7, 0, 3, 7]).goal
  end

  def test_returns_the_goal_when_highest_score_2
    skip
    assert_equal "Your latest score was 7. That's your personal best!", HighScores.new([2, 4, 0, 3, 7]).goal
  end
end

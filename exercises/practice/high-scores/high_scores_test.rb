require 'minitest/autorun'
require_relative 'high_scores'

class HighScoresTest < Minitest::Test
  def test_list_of_scores
    # skip
    scores = [30, 50, 20, 70]
    assert_equal [30, 50, 20, 70], HighScores.new(scores).scores
  end

  def test_latest_score
    skip
    scores = [100, 0, 90, 30]
    assert_equal 30, HighScores.new(scores).latest
  end

  def test_personal_best
    skip
    scores = [40, 100, 70]
    assert_equal 100, HighScores.new(scores).personal_best
  end

  def test_top_3_scores_personal_top_three_from_a_list_of_scores
    skip
    scores = [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
    assert_equal [100, 90, 70], HighScores.new(scores).personal_top_three
  end

  def test_top_3_scores_personal_top_highest_to_lowest
    skip
    scores = [20, 10, 30]
    assert_equal [30, 20, 10], HighScores.new(scores).personal_top_three
  end

  def test_top_3_scores_personal_top_when_there_is_a_tie
    skip
    scores = [40, 20, 40, 30]
    assert_equal [40, 40, 30], HighScores.new(scores).personal_top_three
  end

  def test_top_3_scores_personal_top_when_there_are_less_than_3
    skip
    scores = [30, 70]
    assert_equal [70, 30], HighScores.new(scores).personal_top_three
  end

  def test_top_3_scores_personal_top_when_there_is_only_one
    skip
    scores = [40]
    assert_equal [40], HighScores.new(scores).personal_top_three
  end

  def test_top_3_scores_latest_score_after_personal_top_scores
    skip
    high_scores = HighScores.new([70, 50, 20, 30])
    high_scores.personal_top_three
    assert_equal 30, high_scores.latest
  end

  def test_top_3_scores_scores_after_personal_top_scores
    skip
    high_scores = HighScores.new([30, 50, 20, 70])
    high_scores.personal_top_three
    assert_equal [30, 50, 20, 70], high_scores.scores
  end

  def test_top_3_scores_latest_score_after_personal_best
    skip
    high_scores = HighScores.new([20, 70, 15, 25, 30])
    high_scores.personal_best
    assert_equal 30, high_scores.latest
  end

  def test_top_3_scores_scores_after_personal_best
    skip
    high_scores = HighScores.new([20, 70, 15, 25, 30])
    high_scores.personal_best
    assert_equal [20, 70, 15, 25, 30], high_scores.scores
  end

  def test_latest_score_is_not_the_personal_best
    skip
    scores = [100, 40, 10, 70]
    refute HighScores.new(scores).latest_is_personal_best?
  end

  def test_latest_score_is_the_personal_best
    skip
    scores = [70, 40, 10, 100]
    assert HighScores.new(scores).latest_is_personal_best?
  end
end

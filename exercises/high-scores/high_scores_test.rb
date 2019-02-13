require 'minitest/autorun'
require_relative 'high_scores'

# Common test data version: 4.0.0 ad1f9c4
class HighScoresTest < Minitest::Test
  def test_list_of_scores
    # skip
    scores = [30, 50, 20, 70]
    expected = [30, 50, 20, 70]
    assert_equal expected, HighScores.new(scores).scores
  end

  def test_latest_score
    skip
    scores = [100, 0, 90, 30]
    expected = 30
    assert_equal expected, HighScores.new(scores).latest
  end

  def test_personal_best
    skip
    scores = [40, 100, 70]
    expected = 100
    assert_equal expected, HighScores.new(scores).personal_best
  end

  def test_personal_top_three_from_a_list_of_scores
    skip
    scores = [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
    expected = [100, 90, 70]
    assert_equal expected, HighScores.new(scores).personal_top_three
  end

  def test_personal_top_highest_to_lowest
    skip
    scores = [20, 10, 30]
    expected = [30, 20, 10]
    assert_equal expected, HighScores.new(scores).personal_top_three
  end

  def test_personal_top_when_there_is_a_tie
    skip
    scores = [40, 20, 40, 30]
    expected = [40, 40, 30]
    assert_equal expected, HighScores.new(scores).personal_top_three
  end

  def test_personal_top_when_there_are_less_than_3
    skip
    scores = [30, 70]
    expected = [70, 30]
    assert_equal expected, HighScores.new(scores).personal_top_three
  end

  def test_personal_top_when_there_is_only_one
    skip
    scores = [40]
    expected = [40]
    assert_equal expected, HighScores.new(scores).personal_top_three
  end
end

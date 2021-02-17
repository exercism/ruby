require 'minitest/autorun'
require_relative 'high_score'

class HighScoreTest < Minitest::Test
  def test_blank
    expected = {}
    assert_equal expected, HighScore.blank
  end

  def test_add_player
    player = 'Billy'
    initial_score = 7
    expected = { player => initial_score }
    assert_equal expected, HighScore.add_player(HighScore.blank, player, initial_score)
  end

  def test_remove_player
    player = 'Joel'
    initial_score_board = { player => 45 }
    expected = {}
    assert_equal expected, HighScore.remove_player(initial_score_board, player)
  end

  def test_reset_player
    player = 'Barry'
    initial_score_board = { player => 765 }
    expected = { player => 0 }
    assert_equal expected, HighScore.reset_player_score(initial_score_board, player)
  end

  def test_update_player
    player = 'Jerry'
    initial_score_board = { player => 834 }
    score_to_add = 33
    expected = { player => 867 }
    assert_equal expected, HighScore.update_player_score(initial_score_board, player, score_to_add)
  end

  def test_get_players
    score_board = { 'Ted' => 34, 'Hassan' => 50, 'Pierre' => 20 }
    assert_equal %w[Ted Hassan Pierre], HighScore.get_players(score_board)
  end
end

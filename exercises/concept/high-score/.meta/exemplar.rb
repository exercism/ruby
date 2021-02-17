module HighScore
  INITIAL_SCORE = 0

  def self.blank
    {}
  end

  def self.add_player(score_board, name, initial_score = INITIAL_SCORE)
    score_board[name] = initial_score
    score_board
  end

  def self.remove_player(score_board, name)
    score_board.delete(name)
    score_board
  end

  def self.reset_player_score(score_board, name)
    score_board[name] = INITIAL_SCORE
    score_board
  end

  def self.update_player_score(score_board, name, score)
    score_board[name] += score
    score_board
  end

  def self.get_players(score_board)
    score_board.keys
  end
end

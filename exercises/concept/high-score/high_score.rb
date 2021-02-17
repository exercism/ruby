module HighScore
  def self.blank
    raise NotImplementedError, 'Please implement the HighScore#blank method'
  end

  def self.add_player(score_board, name, initial_score)
    raise NotImplementedError, 'Please implement the HighScore#add_player method'
  end

  def self.remove_player(score_board, name)
    raise NotImplementedError, 'Please implement the HighScore#remove_player method'
  end

  def self.reset_player_score(score_board, name)
    raise NotImplementedError, 'Please implement the HighScore#reset_player_score method'
  end

  def self.update_player_score(score_board, name, score)
    raise NotImplementedError, 'Please implement the HighScore#update_player_score method'
  end

  def self.get_players(score_board)
    raise NotImplementedError, 'Please implement the HighScore#get_players method'
  end
end

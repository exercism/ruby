require 'minitest/autorun'
require_relative 'chess_game'

class ChessTest < Minitest::Test
  def test_have_8_files
    assert_equal 'A'..'H', Chess::FILES
  end

  def test_have_8_ranks
    assert_equal 1..8, Chess::RANKS
  end

  def test_true_when_given_a_valid_square
    assert Chess.valid_square?(1, 'A')
  end

  def test_true_for_another_valid_square
    assert Chess.valid_square?(8, 'H')
  end

  def test_false_when_rank_is_out_of_range
    refute Chess.valid_square?(9, 'B')
  end

  def test_false_when_file_is_out_of_range
    refute Chess.valid_square?(1, 'I')
  end

  def test_false_when_rank_is_less_than_one
    refute Chess.valid_square?(0, 'A')
  end

  def test_correct_player_nick_name
    assert_equal "JOOE", Chess.nick_name("John", "Doe")
  end

  def test_correct_nickname_for_2_letter_last_name
    assert_equal "LILI", Chess.nick_name("Lisa", "Li")
  end

  def test_correct_nickname_for_2_letter_first_name
    assert_equal "DJER", Chess.nick_name("Dj", "Walker")
  end

  def test_correct_message_for_a_move
    assert_equal "JOOE moved to A2", Chess.move_message("John", "Doe", "A2")
  end

  def test_correct_message_when_moving_to_corner
    assert_equal "LILI moved to H8", Chess.move_message("Lisa", "Li", "H8")
  end

  def test_incorrect_message_when_out_of_board
    assert_equal "DJER attempted to move to I9, but that is not a valid square", Chess.move_message("Dj", "Walker", "I9")
  end

  def test_incorrect_message_when_being_on_rank_0
    assert_equal "TOON attempted to move to A0, but that is not a valid square", Chess.move_message("Tore", "Anderson", "A0")
  end
end

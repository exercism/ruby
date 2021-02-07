require 'minitest/autorun'
require_relative 'connect'

# Common test data version: 1.1.0 a02d64d
class ConnectTest < Minitest::Test
  def test_an_empty_board_has_no_winner
    # skip
    board = [
      '. . . . .',
      ' . . . . .',
      '  . . . . .',
      '   . . . . .',
      '    . . . . .'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal '', game.winner, 'an empty board has no winner'
  end

  def test_x_can_win_on_a_1x1_board
    skip
    board = [
      'X'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal 'X', game.winner, 'X can win on a 1x1 board'
  end

  def test_o_can_win_on_a_1x1_board
    skip
    board = [
      'O'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal 'O', game.winner, 'O can win on a 1x1 board'
  end

  def test_only_edges_does_not_make_a_winner
    skip
    board = [
      'O O O X',
      ' X . . X',
      '  X . . X',
      '   X O O O'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal '', game.winner, 'only edges does not make a winner'
  end

  def test_illegal_diagonal_does_not_make_a_winner
    skip
    board = [
      'X O . .',
      ' O X X X',
      '  O X O .',
      '   . O X .',
      '    X X O O'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal '', game.winner, 'illegal diagonal does not make a winner'
  end

  def test_nobody_wins_crossing_adjacent_angles
    skip
    board = [
      'X . . .',
      ' . X O .',
      '  O . X O',
      '   . O . X',
      '    . . O .'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal '', game.winner, 'nobody wins crossing adjacent angles'
  end

  def test_x_wins_crossing_from_left_to_right
    skip
    board = [
      '. O . .',
      ' O X X X',
      '  O X O .',
      '   X X O X',
      '    . O X .'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal 'X', game.winner, 'X wins crossing from left to right'
  end

  def test_o_wins_crossing_from_top_to_bottom
    skip
    board = [
      '. O . .',
      ' O X X X',
      '  O O O .',
      '   X X O X',
      '    . O X .'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal 'O', game.winner, 'O wins crossing from top to bottom'
  end

  def test_x_wins_using_a_convoluted_path
    skip
    board = [
      '. X X . .',
      ' X . X . X',
      '  . X . X .',
      '   . X X . .',
      '    O O O O O'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal 'X', game.winner, 'X wins using a convoluted path'
  end

  def test_x_wins_using_a_spiral_path
    skip
    board = [
      'O X X X X X X X X',
      ' O X O O O O O O O',
      '  O X O X X X X X O',
      '   O X O X O O O X O',
      '    O X O X X X O X O',
      '     O X O O O X O X O',
      '      O X X X X X O X O',
      '       O O O O O O O X O',
      '        X X X X X X X X O'
    ].map { |row| row.gsub(/^ */, '') }
    game = Board.new(board)
    assert_equal 'X', game.winner, 'X wins using a spiral path'
  end
end

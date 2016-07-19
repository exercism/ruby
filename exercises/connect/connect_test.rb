#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'connect'

# Test data version:
# 8268727
class ConnectTest < Minitest::Test
  def test_an_empty_board_has_no_winner
    # skip
    board = [
      ". . . . .",
      ". . . . .",
      ". . . . .",
      ". . . . .",
      ". . . . ."
    ]
    game = Board.new(board)
    assert_equal "", game.winner, "an empty board has no winner"
  end

  def test_only_edges_does_not_make_a_winner
    skip
    board = [
      ". . . . .",
      ". . . . X",
      ". O . X .",
      ". . O . .",
      ". . . O ."
    ]
    game = Board.new(board)
    assert_equal "", game.winner, "only edges does not make a winner"
  end

  def test_rectangle_black___black_wins
    skip
    board = [
      ". O . .",
      "O X X X",
      "O X O .",
      "X X O X",
      ". O X ."
    ]
    game = Board.new(board)
    assert_equal "X", game.winner, "Rectangle black - black wins"
  end

  def test_rectangle_white___white_wins
    skip
    board = [
      ". O . .",
      "O X X X",
      "O O O .",
      "X X O X",
      ". O X ."
    ]
    game = Board.new(board)
    assert_equal "O", game.winner, "Rectangle white - white wins"
  end

  def test_convoluted_path_black_wins
    skip
    board = [
      ". X X . .",
      "X . X . X",
      ". X . X .",
      ". X X . .",
      "O O O O O"
    ]
    game = Board.new(board)
    assert_equal "X", game.winner, "Convoluted path black wins"
  end

  def test_aspiral_black_wins
    skip
    board = [
      "O X X X X X X X X",
      "O X O O O O O O O",
      "O X O X X X X X O",
      "O X O X O O O X O",
      "O X O X X X O X O",
      "O X O O O X O X O",
      "O X X X X X O X O",
      "O O O O O O O X O",
      "X X X X X X X X O"
    ]
    game = Board.new(board)
    assert_equal "X", game.winner, "Aspiral black wins"
  end

end

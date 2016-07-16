#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'connect'

class ConnectTest < Minitest::Test
  EMPTY = [
    '. . . . .',
    ' . . . . .',
    '  . . . . .',
    '   . . . . .',
    '    . . . . .'
  ].freeze

  EDGES_POPULATED_BUT_NO_WINNER = [
    '. . . . .',
    ' . . . . X',
    '  . O . X .',
    '   . . O . .',
    '    . . . O .'
  ].freeze

  RECTANGLE_BLACK = [
    '. O . .',
    ' O X X X',
    '  O X O .',
    '   X X O X',
    '    . O X .'
  ].freeze

  RECTANGLE_WHITE = [
    '. O . .',
    ' O X X X',
    '  O O O .',
    '   X X O X',
    '    . O X .'
  ].freeze

  CONVOLUTED_PATH = [
    '. X X . .',
    ' X . X . X',
    '  . X . X .',
    '   . X X . .',
    '    O O O O O'
  ].freeze

  ASPIRAL = [
    ' O X X X X X X X X',
    '  O X O O O O O O O',
    '   O X O X X X X X O',
    '    O X O X O O O X O',
    '     O X O X X X O X O',
    '      O X O O O X O X O',
    '       O X X X X X O X O',
    '        O O O O O O O X O',
    '         X X X X X X X X O'
  ].freeze

  def test_empty_board_has_no_winner
    board = Board.new EMPTY
    assert_equal board.winner, ''
  end

  def test_empty_board_has_no_winner
    board = Board.new EDGES_POPULATED_BUT_NO_WINNER
    assert_equal board.winner, ''
  end

  def test_1x1_board_wins_black
    board = Board.new ['X']
    assert_equal board.winner, 'X'
  end

  def test_1x1_board_wins_white
    board = Board.new ['O']
    assert_equal board.winner, 'O'
  end

  def test_convoluted_path
    board = Board.new CONVOLUTED_PATH
    assert_equal board.winner, 'X'
  end

  def test_rectangle_white_wins
    board = Board.new RECTANGLE_WHITE
    assert_equal 'O', board.winner
  end

  def test_rectangle_black_wins
    board = Board.new RECTANGLE_BLACK
    board.debug!
    assert_equal 'X', board.winner
  end

  def test_aspiral_black_wins
    board = Board.new ASPIRAL
    assert_equal 'X', board.winner
  end
end

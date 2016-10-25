#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'connect'

# Test data version commit id: 6c6a395
class ConnectTest < Minitest::Test
  def test_an_empty_board_has_no_winner
    # skip
    board = [
      '. . . . .',
      ' . . . . .',
      '  . . . . .',
      '   . . . . .',
      '    . . . . .'
    ]
    game = Board.new(board)
    assert_equal '', game.winner, 'an empty board has no winner'
  end

  def test_only_edges_does_not_make_a_winner
    skip
    board = [
      'O O O X',
      ' X . . X',
      '  X . . X',
      '   X O O O'
    ]
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
    ]
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
    ]
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
    ]
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
    ]
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
    ]
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
    ]
    game = Board.new(board)
    assert_equal 'X', game.winner, 'X wins using a spiral path'
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end

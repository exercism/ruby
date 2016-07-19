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
      '. . . . .',
      '. . . . .',
      '. . . . .',
      '. . . . .',
      '. . . . .'
    ]
    game = Board.new(board)
    assert_equal '', game.winner, 'an empty board has no winner'
  end

  def test_only_edges_does_not_make_a_winner
    skip
    board = [
      '. . . . .',
      '. . . . X',
      '. O . X .',
      '. . O . .',
      '. . . O .'
    ]
    game = Board.new(board)
    assert_equal '', game.winner, 'only edges does not make a winner'
  end

  def test_rectangle_black___black_wins
    skip
    board = [
      '. O . .',
      'O X X X',
      'O X O .',
      'X X O X',
      '. O X .'
    ]
    game = Board.new(board)
    assert_equal 'X', game.winner, 'Rectangle black - black wins'
  end

  def test_rectangle_white___white_wins
    skip
    board = [
      '. O . .',
      'O X X X',
      'O O O .',
      'X X O X',
      '. O X .'
    ]
    game = Board.new(board)
    assert_equal 'O', game.winner, 'Rectangle white - white wins'
  end

  def test_convoluted_path_black_wins
    skip
    board = [
      '. X X . .',
      'X . X . X',
      '. X . X .',
      '. X X . .',
      'O O O O O'
    ]
    game = Board.new(board)
    assert_equal 'X', game.winner, 'Convoluted path black wins'
  end

  def test_aspiral_black_wins
    skip
    board = [
      'O X X X X X X X X',
      'O X O O O O O O O',
      'O X O X X X X X O',
      'O X O X O O O X O',
      'O X O X X X O X O',
      'O X O O O X O X O',
      'O X X X X X O X O',
      'O O O O O O O X O',
      'X X X X X X X X O'
    ]
    game = Board.new(board)
    assert_equal 'X', game.winner, 'Aspiral black wins'
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

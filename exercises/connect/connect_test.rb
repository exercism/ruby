#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'connect'

class ConnectTest < Minitest::Test
  EMPTY = [
    '. . . . .',
    '. . . . .',
    '. . . . .',
    '. . . . .',
    ' . . . . .'
  ].freeze

  EDGES_POPULATED_BUT_NO_WINNER = [
    '. . . . .',
    '. . . . X',
    '. O . X .',
    '. . O . .',
    '. . . O .'
  ].freeze

  RECTANGLE_BLACK = [
    '. O . .',
    'O X X X',
    'O X O .',
    'X X O X',
    '. O X .'
  ].freeze

  RECTANGLE_WHITE = [
    '. O . .',
    'O X X X',
    'O O O .',
    'X X O X',
    '. O X .'
  ].freeze

  CONVOLUTED_PATH = [
    '. X X . .',
    'X . X . X',
    '. X . X .',
    '. X X . .',
    'O O O O O'
  ].freeze

  ASPIRAL = [
    'O X X X X X X X X',
    'O X O O O O O O O',
    'O X O X X X X X O',
    'O X O X O O O X O',
    'O X O X X X O X O',
    'O X O O O X O X O',
    'O X X X X X O X O',
    'O O O O O O O X O',
    'X X X X X X X X O'
  ].freeze

  TEST_CASES = [
    [EMPTY, '', 'an empty board has no winner'],
    [EDGES_POPULATED_BUT_NO_WINNER, '', 'only edges does not make a winner'],
    [['X'], 'X', 'a one cell board with a X should get the winner easy'],
    [['O'], 'O', 'a one cell board with a O should get the winner easy'],
    [[' . '], '', 'a one cell board empty has no winner'],
    [CONVOLUTED_PATH, 'X', 'Convoluted path x wins'],
    [RECTANGLE_BLACK, 'X', 'Rectangle black - black wins'],
    [RECTANGLE_WHITE, 'O', 'Rectangle white - white wins'],
    [ASPIRAL, 'X', 'Aspiral black wins']
  ].freeze

  TEST_CASES.each do |game, expected_result, error_message|
    define_method("test_#{error_message.tr(' ', '_')}") do
      board = Board.new game
      msg = "#{error_message}\nCurrent board: \n #{board}"
      assert_equal expected_result, board.winner, msg
    end
  end
end

#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'queen_attack'

class QueensTest < Minitest::Test
  def test_specific_placement
    skip
    queens = Queens.new(white: [3, 7], black: [6, 1])
    assert_equal [3, 7], queens.white
    assert_equal [6, 1], queens.black
  end

  def test_multiple_boards_simultaneously
    skip
    queens1 = Queens.new(white: [3, 7], black: [6, 1])
    queens2 = Queens.new(white: [5, 4], black: [7, 7])
    assert_equal [3, 7], queens1.white
    assert_equal [6, 1], queens1.black
    assert_equal [5, 4], queens2.white
    assert_equal [7, 7], queens2.black
  end

  def test_queens_must_have_a_positive_rank
    skip
    assert_raises(ArgumentError) { Queens.new(white: [-1, 4], black: [2, 4]) }
    assert_raises(ArgumentError) { Queens.new(white: [2, 4], black: [-1, 4]) }
  end

  def test_queens_must_have_a_positive_file
    skip
    assert_raises(ArgumentError) { Queens.new(white: [4, -1], black: [4, 2]) }
    assert_raises(ArgumentError) { Queens.new(white: [4, 2], black: [4, -1]) }
  end

  def test_queen_ranks_do_not_exceed_board_size
    skip
    assert_raises(ArgumentError) { Queens.new(white: [8, 4], black: [2, 4]) }
    assert_raises(ArgumentError) { Queens.new(white: [2, 4], black: [8, 4]) }
  end

  def test_queen_files_do_not_exceed_board_size
    skip
    assert_raises(ArgumentError) { Queens.new(white: [2, 8], black: [2, 4]) }
    assert_raises(ArgumentError) { Queens.new(white: [2, 4], black: [2, 8]) }
  end

  def test_cannot_occupy_same_space
    skip
    assert_raises(ArgumentError) { Queens.new(white: [2, 4], black: [2, 4]) }
  end

  def test_string_representation # rubocop:disable Metrics/MethodLength
    skip
    queens = Queens.new(white: [2, 4], black: [6, 6])
    board = <<-BOARD.chomp
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ W _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
    BOARD
    assert_equal board, queens.to_s
  end

  def test_another_string_representation # rubocop:disable Metrics/MethodLength
    skip
    queens = Queens.new(white: [7, 1], black: [0, 0])
    board = <<-BOARD.chomp
B _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
    BOARD
    assert_equal board, queens.to_s
  end

  # rubocop:disable Metrics/MethodLength
  def test_yet_another_string_representation
    skip
    queens = Queens.new(white: [4, 3], black: [3, 4])
    board = <<-BOARD.chomp
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ B _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
    BOARD
    assert_equal board, queens.to_s
  end

  def test_cannot_attack
    skip
    queens = Queens.new(white: [2, 3], black: [4, 7])
    assert !queens.attack?
  end
  # rubocop:enable Metrics/MethodLength

  def test_can_attack_on_same_row
    skip
    queens = Queens.new(white: [2, 4], black: [2, 7])
    assert queens.attack?
  end

  def test_can_attack_on_same_column
    skip
    queens = Queens.new(white: [5, 4], black: [2, 4])
    assert queens.attack?
  end

  def test_can_attack_on_diagonal
    skip
    queens = Queens.new(white: [1, 1], black: [6, 6])
    assert queens.attack?
  end

  def test_can_attack_on_other_diagonal
    skip
    queens = Queens.new(white: [0, 6], black: [1, 7])
    assert queens.attack?
  end

  def test_can_attack_on_yet_another_diagonal
    skip
    queens = Queens.new(white: [4, 1], black: [6, 3])
    assert queens.attack?
  end

  def test_can_attack_on_a_diagonal_slanted_the_other_way
    skip
    queens = Queens.new(white: [6, 1], black: [1, 6])
    assert queens.attack?
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module.
  #  In your file, it will look like this:
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

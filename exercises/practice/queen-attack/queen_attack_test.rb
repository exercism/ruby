require 'minitest/autorun'
require_relative 'queen_attack'

class QueenAttackTest < Minitest::Test
  def test_new_queen_with_a_valid_position
    # skip
    assert Queens.new(white: [2, 2])
  end

  def test_new_queen_must_have_positive_row
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [-2, 2])
    end
  end

  def test_new_queen_must_have_row_on_board
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [8, 4])
    end
  end

  def test_new_queen_must_have_positive_column
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [2, -2])
    end
  end

  def test_new_queen_must_have_column_on_board
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [4, 8])
    end
  end

  def test_queens_cannot_attack
    skip
    refute Queens.new(white: [2, 4], black: [6, 6]).attack?
  end

  def test_queens_can_attack_on_same_row
    skip
    assert Queens.new(white: [2, 4], black: [2, 6]).attack?
  end

  def test_queens_can_attack_on_same_column
    skip
    assert Queens.new(white: [4, 5], black: [2, 5]).attack?
  end

  def test_queens_can_attack_on_first_diagonal
    skip
    assert Queens.new(white: [2, 2], black: [0, 4]).attack?
  end

  def test_queens_can_attack_on_second_diagonal
    skip
    assert Queens.new(white: [2, 2], black: [3, 1]).attack?
  end

  def test_queens_can_attack_on_third_diagonal
    skip
    assert Queens.new(white: [2, 2], black: [1, 1]).attack?
  end

  def test_queens_can_attack_on_fourth_diagonal
    skip
    assert Queens.new(white: [1, 7], black: [0, 6]).attack?
  end

  def test_queens_cannot_attack_if_falling_diagonals_are_only_the_same_when_reflected_across_the_longest_falling_diagonal
    skip
    refute Queens.new(white: [4, 1], black: [2, 5]).attack?
  end
end

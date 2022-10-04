require 'minitest/autorun'
require_relative 'queen_attack'

class QueenAttackTest < Minitest::Test
  def test_queen_with_a_valid_position
    # skip
    assert Queens.new(white: [2, 2])
  end

  def test_queen_must_have_positive_row
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [-2, 2])
    end
  end

  def test_queen_must_have_row_on_board
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [8, 4])
    end
  end

  def test_queen_must_have_positive_column
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [2, -2])
    end
  end

  def test_queen_must_have_column_on_board
    skip
    assert_raises(ArgumentError) do
      Queens.new(white: [4, 8])
    end
  end

  def test_can_not_attack
    skip
    queens = Queens.new(white: [2, 4], black: [6, 6])
    refute queens.attack?
  end

  def test_can_attack_on_same_row
    skip
    queens = Queens.new(white: [2, 4], black: [2, 6])
    assert queens.attack?
  end

  def test_can_attack_on_same_column
    skip
    queens = Queens.new(white: [4, 5], black: [2, 5])
    assert queens.attack?
  end

  def test_can_attack_on_first_diagonal
    skip
    queens = Queens.new(white: [2, 2], black: [0, 4])
    assert queens.attack?
  end

  def test_can_attack_on_second_diagonal
    skip
    queens = Queens.new(white: [2, 2], black: [3, 1])
    assert queens.attack?
  end

  def test_can_attack_on_third_diagonal
    skip
    queens = Queens.new(white: [2, 2], black: [1, 1])
    assert queens.attack?
  end

  def test_can_attack_on_fourth_diagonal
    skip
    queens = Queens.new(white: [2, 2], black: [5, 5])
    assert queens.attack?
  end
end

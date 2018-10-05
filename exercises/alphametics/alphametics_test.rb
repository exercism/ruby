require 'minitest/autorun'
require_relative 'alphametics'

# Common test data version: 1.3.0 361cf3c
class AlphameticsTest < Minitest::Test
  def test_puzzle_with_three_letters
    # skip
    puzzle = 'I + BB == ILL'
    expected = { 'B' => 9, 'I' => 1, 'L' => 0 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  def test_solution_must_have_unique_value_for_each_letter
    skip
    puzzle = 'A == B'
    expected = {}
    assert_equal expected, Alphametics.solve(puzzle)
  end

  def test_leading_zero_solution_is_invalid
    skip
    puzzle = 'ACA + DD == BD'
    expected = {}
    assert_equal expected, Alphametics.solve(puzzle)
  end

  def test_puzzle_with_two_digits_final_carry
    skip
    puzzle = 'A + A + A + A + A + A + A + A + A + A + A + B == BCC'
    expected = { 'A' => 9, 'B' => 1, 'C' => 0 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  def test_puzzle_with_four_letters
    skip
    puzzle = 'AS + A == MOM'
    expected = { 'A' => 9, 'M' => 1, 'O' => 0, 'S' => 2 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  def test_puzzle_with_six_letters
    skip
    puzzle = 'NO + NO + TOO == LATE'
    expected = { 'A' => 0, 'E' => 2, 'L' => 1, 'N' => 7,
                 'O' => 4, 'T' => 9 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  def test_puzzle_with_seven_letters
    skip
    puzzle = 'HE + SEES + THE == LIGHT'
    expected = { 'E' => 4, 'G' => 2, 'H' => 5, 'I' => 0,
                 'L' => 1, 'S' => 9, 'T' => 7 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  def test_puzzle_with_eight_letters
    skip
    puzzle = 'SEND + MORE == MONEY'
    expected = { 'D' => 7, 'E' => 5, 'M' => 1, 'N' => 6,
                 'O' => 0, 'R' => 8, 'S' => 9, 'Y' => 2 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  def test_puzzle_with_ten_letters
    skip
    puzzle = 'AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE'
    expected = { 'A' => 5, 'D' => 3, 'E' => 4, 'F' => 7,
                 'G' => 8, 'N' => 0, 'O' => 2, 'R' => 1,
                 'S' => 6, 'T' => 9 }
    assert_equal expected, Alphametics.solve(puzzle)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  #
  # Remove 'do_not_' from the test name to run this test.
  def do_not_test_puzzle_with_ten_letters_and_199_addends
    skip
    puzzle = 'THIS + A + FIRE + THEREFORE + FOR + ALL + HISTORIES + I + TELL + A + TALE + THAT + FALSIFIES + ITS + TITLE + TIS + A + LIE + THE + TALE + OF + THE + LAST + FIRE + HORSES + LATE + AFTER + THE + FIRST + FATHERS + FORESEE + THE + HORRORS + THE + LAST + FREE + TROLL + TERRIFIES + THE + HORSES + OF + FIRE + THE + TROLL + RESTS + AT + THE + HOLE + OF + LOSSES + IT + IS + THERE + THAT + SHE + STORES + ROLES + OF + LEATHERS + AFTER + SHE + SATISFIES + HER + HATE + OFF + THOSE + FEARS + A + TASTE + RISES + AS + SHE + HEARS + THE + LEAST + FAR + HORSE + THOSE + FAST + HORSES + THAT + FIRST + HEAR + THE + TROLL + FLEE + OFF + TO + THE + FOREST + THE + HORSES + THAT + ALERTS + RAISE + THE + STARES + OF + THE + OTHERS + AS + THE + TROLL + ASSAILS + AT + THE + TOTAL + SHIFT + HER + TEETH + TEAR + HOOF + OFF + TORSO + AS + THE + LAST + HORSE + FORFEITS + ITS + LIFE + THE + FIRST + FATHERS + HEAR + OF + THE + HORRORS + THEIR + FEARS + THAT + THE + FIRES + FOR + THEIR + FEASTS + ARREST + AS + THE + FIRST + FATHERS + RESETTLE + THE + LAST + OF + THE + FIRE + HORSES + THE + LAST + TROLL + HARASSES + THE + FOREST + HEART + FREE + AT + LAST + OF + THE + LAST + TROLL + ALL + OFFER + THEIR + FIRE + HEAT + TO + THE + ASSISTERS + FAR + OFF + THE + TROLL + FASTS + ITS + LIFE + SHORTER + AS + STARS + RISE + THE + HORSES + REST + SAFE + AFTER + ALL + SHARE + HOT + FISH + AS + THEIR + AFFILIATES + TAILOR + A + ROOFS + FOR + THEIR + SAFE == FORTRESSES'
    expected = { 'A' => 1, 'E' => 0, 'F' => 5, 'H' => 8,
                 'I' => 7, 'L' => 2, 'O' => 6, 'R' => 3,
                 'S' => 4, 'T' => 9 }
    assert_equal expected, Alphametics.solve(puzzle)
  end
end

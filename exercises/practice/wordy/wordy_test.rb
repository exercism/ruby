require 'minitest/autorun'
require_relative 'wordy'

class WordyTest < Minitest::Test
  def test_just_a_number
    # skip
    actual = WordProblem.new("What is 5?").answer
    expected = 5
    assert_equal expected, actual
  end

  def test_just_a_zero
    skip
    actual = WordProblem.new("What is 0?").answer
    expected = 0
    assert_equal expected, actual
  end

  def test_just_a_negative_number
    skip
    actual = WordProblem.new("What is -123?").answer
    expected = -123
    assert_equal expected, actual
  end

  def test_addition
    skip
    actual = WordProblem.new("What is 1 plus 1?").answer
    expected = 2
    assert_equal expected, actual
  end

  def test_addition_with_a_left_hand_zero
    skip
    actual = WordProblem.new("What is 0 plus 2?").answer
    expected = 2
    assert_equal expected, actual
  end

  def test_addition_with_a_right_hand_zero
    skip
    actual = WordProblem.new("What is 3 plus 0?").answer
    expected = 3
    assert_equal expected, actual
  end

  def test_more_addition
    skip
    actual = WordProblem.new("What is 53 plus 2?").answer
    expected = 55
    assert_equal expected, actual
  end

  def test_addition_with_negative_numbers
    skip
    actual = WordProblem.new("What is -1 plus -10?").answer
    expected = -11
    assert_equal expected, actual
  end

  def test_large_addition
    skip
    actual = WordProblem.new("What is 123 plus 45678?").answer
    expected = 45_801
    assert_equal expected, actual
  end

  def test_subtraction
    skip
    actual = WordProblem.new("What is 4 minus -12?").answer
    expected = 16
    assert_equal expected, actual
  end

  def test_multiplication
    skip
    actual = WordProblem.new("What is -3 multiplied by 25?").answer
    expected = -75
    assert_equal expected, actual
  end

  def test_division
    skip
    actual = WordProblem.new("What is 33 divided by -3?").answer
    expected = -11
    assert_equal expected, actual
  end

  def test_multiple_additions
    skip
    actual = WordProblem.new("What is 1 plus 1 plus 1?").answer
    expected = 3
    assert_equal expected, actual
  end

  def test_addition_and_subtraction
    skip
    actual = WordProblem.new("What is 1 plus 5 minus -2?").answer
    expected = 8
    assert_equal expected, actual
  end

  def test_multiple_subtraction
    skip
    actual = WordProblem.new("What is 20 minus 4 minus 13?").answer
    expected = 3
    assert_equal expected, actual
  end

  def test_subtraction_then_addition
    skip
    actual = WordProblem.new("What is 17 minus 6 plus 3?").answer
    expected = 14
    assert_equal expected, actual
  end

  def test_multiple_multiplication
    skip
    actual = WordProblem.new("What is 2 multiplied by -2 multiplied by 3?").answer
    expected = -12
    assert_equal expected, actual
  end

  def test_addition_and_multiplication
    skip
    actual = WordProblem.new("What is -3 plus 7 multiplied by -2?").answer
    expected = -8
    assert_equal expected, actual
  end

  def test_multiple_division
    skip
    actual = WordProblem.new("What is -12 divided by 2 divided by -3?").answer
    expected = 2
    assert_equal expected, actual
  end

  def test_unknown_operation
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is 52 cubed?")
      problem.answer
    end
  end

  def test_non_math_question
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("Who is the President of the United States?")
      problem.answer
    end
  end

  def test_reject_problem_missing_an_operand
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is 1 plus?")
      problem.answer
    end
  end

  def test_reject_problem_with_no_operands_or_operators
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is?")
      problem.answer
    end
  end

  def test_reject_two_operations_in_a_row
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is 1 plus plus 2?")
      problem.answer
    end
  end

  def test_reject_two_numbers_in_a_row
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is 1 plus 2 1?")
      problem.answer
    end
  end

  def test_reject_postfix_notation
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is 1 2 plus?")
      problem.answer
    end
  end

  def test_reject_prefix_notation
    skip
    assert_raises(ArgumentError) do
      problem = WordProblem.new("What is plus 1 2?")
      problem.answer
    end
  end
end

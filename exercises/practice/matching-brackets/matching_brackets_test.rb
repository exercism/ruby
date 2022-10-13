require 'minitest/autorun'
require_relative 'matching_brackets'

class MatchingBracketsTest < Minitest::Test
  def test_paired_square_brackets
    # skip
    assert Brackets.paired?("[]")
  end

  def test_empty_string
    skip
    assert Brackets.paired?("")
  end

  def test_unpaired_brackets
    skip
    refute Brackets.paired?("[[")
  end

  def test_wrong_ordered_brackets
    skip
    refute Brackets.paired?("}{")
  end

  def test_wrong_closing_bracket
    skip
    refute Brackets.paired?("{]")
  end

  def test_paired_with_whitespace
    skip
    assert Brackets.paired?("{ }")
  end

  def test_partially_paired_brackets
    skip
    refute Brackets.paired?("{[])")
  end

  def test_simple_nested_brackets
    skip
    assert Brackets.paired?("{[]}")
  end

  def test_several_paired_brackets
    skip
    assert Brackets.paired?("{}[]")
  end

  def test_paired_and_nested_brackets
    skip
    assert Brackets.paired?("([{}({}[])])")
  end

  def test_unopened_closing_brackets
    skip
    refute Brackets.paired?("{[)][]}")
  end

  def test_unpaired_and_nested_brackets
    skip
    refute Brackets.paired?("([{])")
  end

  def test_paired_and_wrong_nested_brackets
    skip
    refute Brackets.paired?("[({]})")
  end

  def test_paired_and_wrong_nested_brackets_but_innermost_are_correct
    skip
    refute Brackets.paired?("[({}])")
  end

  def test_paired_and_incomplete_brackets
    skip
    refute Brackets.paired?("{}[")
  end

  def test_too_many_closing_brackets
    skip
    refute Brackets.paired?("[]]")
  end

  def test_early_unexpected_brackets
    skip
    refute Brackets.paired?(")()")
  end

  def test_early_mismatched_brackets
    skip
    refute Brackets.paired?("{)()")
  end

  def test_math_expression
    skip
    assert Brackets.paired?("(((185 + 223.85) * 15) - 543)/2")
  end

  def test_complex_latex_expression
    skip
    assert Brackets.paired?("\left(\begin{array}{cc} \frac{1}{3} & x\ \mathrm{e}^{x} &... x^2 \end{array}\right)")
  end
end

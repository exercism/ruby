#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'bracket_push'

# Common test data version: 1.1.0 855c591
class BracketPushTest < Minitest::Test
  def test_paired_square_brackets
    # skip
    assert Brackets.paired?('[]')
  end

  def test_empty_string
    skip
    assert Brackets.paired?('')
  end

  def test_unpaired_brackets
    skip
    refute Brackets.paired?('[[')
  end

  def test_wrong_ordered_brackets
    skip
    refute Brackets.paired?('}{')
  end

  def test_wrong_closing_bracket
    skip
    refute Brackets.paired?('{]')
  end

  def test_paired_with_whitespace
    skip
    assert Brackets.paired?('{ }')
  end

  def test_simple_nested_brackets
    skip
    assert Brackets.paired?('{[]}')
  end

  def test_several_paired_brackets
    skip
    assert Brackets.paired?('{}[]')
  end

  def test_paired_and_nested_brackets
    skip
    assert Brackets.paired?('([{}({}[])])')
  end

  def test_unopened_closing_brackets
    skip
    refute Brackets.paired?('{[)][]}')
  end

  def test_unpaired_and_nested_brackets
    skip
    refute Brackets.paired?('([{])')
  end

  def test_paired_and_wrong_nested_brackets
    skip
    refute Brackets.paired?('[({]})')
  end

  def test_math_expression
    skip
    assert Brackets.paired?('(((185 + 223.85) * 15) - 543)/2')
  end

  def test_complex_latex_expression
    skip
    str = '\left(\begin{array}{cc} \frac{1}{3} & x\\ '\
          '\mathrm{e}^{x} &... x^2 \end{array}\right)'
    assert Brackets.paired?(str)
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
    assert_equal 4, BookKeeping::VERSION
  end
end

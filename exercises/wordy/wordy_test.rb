#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'wordy'

# Common test data version: 1.0.0 5b8ad58
class WordyTest < Minitest::Test
  def test_addition
    # skip
    question = 'What is 1 plus 1?'
    assert_equal(2, WordProblem.new(question).answer)
  end

  def test_more_addition
    skip
    question = 'What is 53 plus 2?'
    assert_equal(55, WordProblem.new(question).answer)
  end

  def test_addition_with_negative_numbers
    skip
    question = 'What is -1 plus -10?'
    assert_equal(-11, WordProblem.new(question).answer)
  end

  def test_large_addition
    skip
    question = 'What is 123 plus 45678?'
    assert_equal(45801, WordProblem.new(question).answer)
  end

  def test_subtraction
    skip
    question = 'What is 4 minus -12?'
    assert_equal(16, WordProblem.new(question).answer)
  end

  def test_multiplication
    skip
    question = 'What is -3 multiplied by 25?'
    assert_equal(-75, WordProblem.new(question).answer)
  end

  def test_division
    skip
    question = 'What is 33 divided by -3?'
    assert_equal(-11, WordProblem.new(question).answer)
  end

  def test_multiple_additions
    skip
    question = 'What is 1 plus 1 plus 1?'
    assert_equal(3, WordProblem.new(question).answer)
  end

  def test_addition_and_subtraction
    skip
    question = 'What is 1 plus 5 minus -2?'
    assert_equal(8, WordProblem.new(question).answer)
  end

  def test_multiple_subtraction
    skip
    question = 'What is 20 minus 4 minus 13?'
    assert_equal(3, WordProblem.new(question).answer)
  end

  def test_subtraction_then_addition
    skip
    question = 'What is 17 minus 6 plus 3?'
    assert_equal(14, WordProblem.new(question).answer)
  end

  def test_multiple_multiplication
    skip
    question = 'What is 2 multiplied by -2 multiplied by 3?'
    assert_equal(-12, WordProblem.new(question).answer)
  end

  def test_addition_and_multiplication
    skip
    question = 'What is -3 plus 7 multiplied by -2?'
    answer = WordProblem.new(question).answer
    message = "You should ignore order of precedence. -3 + 7 * -2 = -8, not #{answer}"
    assert_equal(-8, answer, message)
  end

  def test_multiple_division
    skip
    question = 'What is -12 divided by 2 divided by -3?'
    assert_equal(2, WordProblem.new(question).answer)
  end

  def test_unknown_operation
    skip
    question = 'What is 52 cubed?'
    assert_raises ArgumentError do
      WordProblem.new(question).answer
    end
  end

  def test_non_math_question
    skip
    question = 'Who is the President of the United States?'
    assert_raises ArgumentError do
      WordProblem.new(question).answer
    end
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

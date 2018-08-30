require 'generator/exercise_case'

class WordyCase < Generator::ExerciseCase

  def workload
    assertion
  end

  private

  def error_expected?
    expected == false
  end

  def assertion
    return error_assertion if error_expected?
    return message_assertion if message

    [
      "problem = WordProblem.new(#{question.inspect})",
      "assert_equal(#{expected}, problem.answer)"
    ]
  end

  def error_assertion
    [
      "problem = WordProblem.new(#{question.inspect})",
      assert_raises(ArgumentError, 'problem.answer')
    ]
  end

  def message_assertion
    [
      "problem = WordProblem.new(#{question.inspect})",
      "message = \"#{message % '#{problem.answer}'}\"",
      "assert_equal(#{expected}, problem.answer, message)",
    ].join("\n")
  end

  def message
    if question == 'What is -3 plus 7 multiplied by -2?'
      'You should ignore order of precedence. -3 + 7 * -2 = -8, not %s'
    end
  end
end

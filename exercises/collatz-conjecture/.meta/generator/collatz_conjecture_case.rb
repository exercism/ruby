require 'generator/exercise_case'

class CollatzConjectureCase < Generator::ExerciseCase

  def workload
    case expected
    when Integer
      standard_assertion
    when Hash
      error_assertion
    end
  end

  def standard_assertion
    assert_equal { subject_of_test }
  end

  def error_assertion
    "assert_raises(ArgumentError) { #{subject_of_test} }"
  end

  def subject_of_test
    "CollatzConjecture.steps(#{input})"
  end

  def input
    literal(number)
  end
end


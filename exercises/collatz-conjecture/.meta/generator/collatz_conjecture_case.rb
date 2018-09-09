require 'generator/exercise_case'

class CollatzConjectureCase < Generator::ExerciseCase
  def workload
    error_expected? ? error_assertion : standard_assertion
  end

  def error_assertion
    assert_raises(ArgumentError, subject_of_test)
  end

  def standard_assertion
    assert_equal(expected, subject_of_test)
  end

  def subject_of_test
    "CollatzConjecture.steps(#{underscore(input_number)})"
  end
end


require 'generator/exercise_case'

class ChangeCase < Generator::ExerciseCase
  def workload
    if error_expected?
      handle_errors
    else
      assert_equal(expected, subject_of_test)
    end
  end

  private

  def handle_errors
    case test_name
    when 'test_cannot_find_negative_change_values'
      assert_raises('Change::NegativeTargetError', subject_of_test)
    else
      assert_raises('Change::ImpossibleCombinationError', subject_of_test)
    end
  end

  def subject_of_test
    "Change.generate(#{coins}, #{target})"
  end
end

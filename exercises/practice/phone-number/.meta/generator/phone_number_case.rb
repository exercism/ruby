require 'generator/exercise_case'

class PhoneNumberCase < Generator::ExerciseCase
  def workload
    if error_expected?
      assert_equal(nil, subject_of_test)
    else
      assert_equal(expected, subject_of_test)
    end
  end

  private

  def subject_of_test
    "PhoneNumber.clean(#{phrase.inspect})"
  end
end

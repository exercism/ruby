require 'generator/exercise_case'

class HammingCase < Generator::ExerciseCase
  def workload
    if error_expected?
      assert_raises(ArgumentError, subject_of_test)
    else
      assert_equal(expected, subject_of_test)
    end
  end

  private

  def subject_of_test
    "Hamming.compute('#{strand1}', '#{strand2}')"
  end
end

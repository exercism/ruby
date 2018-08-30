require 'generator/exercise_case'

class BinaryCase < Generator::ExerciseCase

  def workload
    error_expected? ? error_assertion : equality_assertion
  end

  private

  # "binary" is using a non-standard canonical data format so we need
  # to override this method.
  def error_expected?
    expected.nil?
  end

  def error_assertion
    [
    "assert_raises(ArgumentError) do\n",
    "  #{subject_of_test}\n",
    "end\n"
    ].join
  end

  def equality_assertion
    "assert_equal #{expected}, #{subject_of_test}\n"
  end

  def subject_of_test
    "Binary.to_decimal('#{binary}')"
  end
end

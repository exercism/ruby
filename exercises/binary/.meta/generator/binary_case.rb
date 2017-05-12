require 'generator/exercise_case'

class BinaryCase < Generator::ExerciseCase

  def workload
    raises_error? ? error_assertion : equality_assertion
  end

  private

  def error_assertion
    "assert_raises(ArgumentError) { #{test_case} }"
  end

  def equality_assertion
    "assert_equal #{expected}, #{test_case}"
  end

  def test_case
    "Binary.to_decimal('#{binary}')"
  end

  def raises_error?
    expected.nil?
  end
end

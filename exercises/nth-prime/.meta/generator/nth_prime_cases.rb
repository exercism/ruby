require 'generator/exercise_cases'

class NthPrimeCase < ExerciseCase

  def workload
    if raises_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    "Prime.nth(#{input})"
  end

  def raises_error?
    expected == false
  end

end

require 'generator/exercise_cases'

class LargestSeriesProductCase < Generator::ExerciseCase

  def workload
    if raises_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    "Series.new('#{digits}').largest_product(#{span})"
  end

end

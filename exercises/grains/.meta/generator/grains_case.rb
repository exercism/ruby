require 'generator/exercise_case'

class GrainsCase < Generator::ExerciseCase
  def workload
    send("#{property}_workload")
  end

  private

  def square_workload
    subject_of_test = "Grains.square(#{square})"
    if error_expected?
      assert_raises(ArgumentError, subject_of_test)
    else
      "assert_equal #{underscore(expected)}, #{subject_of_test}"
    end
  end

  def total_workload
    "assert_equal #{underscore(expected)}, Grains.total"
  end
end

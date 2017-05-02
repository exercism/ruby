require 'generator/exercise_cases'

class GrainsCase < Generator::ExerciseCase

  def workload
    send("#{property}_workload")
  end

  private

  def square_workload
    if raises_error?
      "assert_raises(ArgumentError) { Grains.square(#{input}) }"
    else
      "assert_equal #{underscore_format(expected)}, Grains.square(#{input})"
    end
  end

  def total_workload
    "assert_equal #{underscore_format(expected)}, Grains.total"
  end

  def underscore_format(number)
    number.to_s.reverse.gsub(/...(?=.)/, '\&_').reverse
  end
end

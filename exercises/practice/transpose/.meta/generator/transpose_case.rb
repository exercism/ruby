require 'generator/exercise_case'

class TransposeCase < Generator::ExerciseCase

  def workload
    [
      "input = #{to_string(lines)}",
      "",
      "expected = #{to_string(expected)}",
      "",
      "assert_equal expected, Transpose.transpose(input)"
    ]
  end

end

require 'generator/exercise_case'

class BobCase < Generator::ExerciseCase
  def workload
    indent_lines(["remark = #{input.inspect}",
      "assert_equal '#{expected}', Bob.hey(remark), %q{Bob hears #{input.inspect}, and..}"
    ], 4)
  end
end

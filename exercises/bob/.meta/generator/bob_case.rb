require 'generator/exercise_case'

class BobCase < Generator::ExerciseCase
  def workload
    indent_lines(["remark = #{input["heyBob"].inspect}",
      "assert_equal #{expected.inspect}, Bob.hey(remark), %q{Bob hears #{input["heyBob"].inspect}, and..}"
    ], 4)
  end
end


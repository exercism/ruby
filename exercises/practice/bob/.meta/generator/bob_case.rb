require 'generator/exercise_case'

class BobCase < Generator::ExerciseCase
  def workload
    [
     "remark = #{input["heyBob"].inspect}\n",
     "assert_equal #{expected.inspect}, Bob.hey(remark), %q{Bob hears #{input["heyBob"].inspect}, and..}\n"
    ].join
  end
end


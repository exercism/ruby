require 'generator/exercise_case'

class DartsCase < Generator::ExerciseCase
  def workload
    [
      "darts = Darts.new(#{input["x"]}, #{input["y"]})\n",
      "assert_equal(#{expected.inspect}, darts.score)\n"
    ].join
  end
end

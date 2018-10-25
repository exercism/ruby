require 'generator/exercise_case'

class HighScoresCase < Generator::ExerciseCase
  def workload
    [
      "scores = #{scores}",
      "expected = #{expected.inspect}",
      "assert_equal expected, HighScores.new(scores).#{property}"
    ]
  end
end

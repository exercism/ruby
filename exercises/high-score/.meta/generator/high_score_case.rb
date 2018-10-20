require 'generator/exercise_case'

class HighScoreCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, subject_of_test)
  end

  private

  def subject_of_test
    "HighScore.new(#{scores}).#{property}"
  end
end

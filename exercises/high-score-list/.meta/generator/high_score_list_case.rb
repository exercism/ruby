require 'generator/exercise_case'

class HighScoreListCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, subject_of_test)
  end

  private

  def subject_of_test
    "HighScoreList.new(#{scores}).#{property}"
  end
end

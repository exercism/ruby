require 'generator/exercise_case'

class TwoFerCase < Generator::ExerciseCase

  def workload
    assert_equal { "TwoFer.two_fer" }
  end

end

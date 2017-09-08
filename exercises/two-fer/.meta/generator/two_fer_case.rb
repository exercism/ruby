require 'generator/exercise_case'

class TwoFerCase < Generator::ExerciseCase

  def workload
    assert_equal { "TwoFer.getResponse('#{input}')" }
  end

end

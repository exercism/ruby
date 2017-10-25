require 'generator/exercise_case'

class TwoFerCase < Generator::ExerciseCase

  def workload
    if input == nil
      assert_equal {"TwoFer.two_fer"}
    else
      assert_equal { "TwoFer.two_fer(#{input.inspect})" }
    end
  end
end

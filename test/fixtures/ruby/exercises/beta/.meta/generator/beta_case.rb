require 'generator/exercise_case'

class BetaCase < Generator::ExerciseCase
  def workload
    assert_equal { "Beta.call('#{input}')" }
  end
end

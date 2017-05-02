require 'generator/exercise_cases'

class BetaCase < Generator::ExerciseCase
  def workload
    assert_equal { "Beta.call('#{input}')" }
  end
end

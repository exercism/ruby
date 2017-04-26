require 'exercise_cases'

class BetaCase < ExerciseCase
  def workload
    assert_equal { "Beta.call('#{input}')" }
  end
end

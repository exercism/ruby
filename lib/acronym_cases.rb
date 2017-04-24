require 'exercise_cases'

class AcronymCase < ExerciseCase

  def workload
    assert_equal { "Acronym.abbreviate('#{phrase}')" }
  end

end

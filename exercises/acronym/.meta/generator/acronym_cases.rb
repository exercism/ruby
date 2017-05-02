require 'generator/exercise_cases'

class AcronymCase < Generator::ExerciseCase

  def workload
    assert_equal { "Acronym.abbreviate('#{phrase}')" }
  end

end

require 'generator/exercise_case'

class AcronymCase < Generator::ExerciseCase

  def workload
    assert_equal { "Acronym.abbreviate('#{phrase}')" }
  end

end

require 'generator/exercise_case'

class AcronymCase < Generator::ExerciseCase

  def workload
    assert_equal { "Acronym.abbreviate('#{canonical.phrase}')" }
  end

end

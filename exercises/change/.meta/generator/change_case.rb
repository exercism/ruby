require 'generator/exercise_case'

class ChangeCase < Generator::ExerciseCase

  def workload
    assert_equal { "Change.generate(#{coins}, #{target})" }
  end

end

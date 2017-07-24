require 'generator/exercise_case'

class ChangeCase < Generator::ExerciseCase

  def workload
    assert_equal { "Change.generate(#{coins.inspect}, #{target.inspect})" }
  end

end

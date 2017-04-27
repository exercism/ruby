require 'generator/exercise_cases'

class RaindropsCase < ExerciseCase

  def workload
    assert_equal { "Raindrops.convert(#{number})" }
  end

end

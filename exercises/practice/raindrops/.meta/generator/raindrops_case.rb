require 'generator/exercise_case'

class RaindropsCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, "Raindrops.convert(#{number})")
  end
end

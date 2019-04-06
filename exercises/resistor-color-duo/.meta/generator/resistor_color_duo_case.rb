require 'generator/exercise_case'

class ResistorColorDuoCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, "ResistorColorDuo.value(#{colors})")
  end
end

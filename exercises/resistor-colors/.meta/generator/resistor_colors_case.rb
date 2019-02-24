require 'generator/exercise_case'

class ResistorColorsCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, "ResistorColors.value(#{colors})")
  end
end

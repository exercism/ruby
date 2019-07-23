require 'generator/exercise_case'

class ResistorColorCase < Generator::ExerciseCase
  def workload
    send("#{snake_case(property)}_workload")
  end

  private

  def color_code_workload
    assert_equal(expected, "ResistorColor.color_code(#{color.inspect})")
  end

  # Instead of specifying a `colors` method like the canonical data suggests
  # we expect the student to define a COLORS constant.
  def colors_workload
    [
      "expected = #{expected}",
      "assert_equal expected, ResistorColor::COLORS"
    ]
  end
end

require 'generator/exercise_case'

class ResistorColorCase < Generator::ExerciseCase
  def workload
    send("#{snake_case(property)}_workload")
  end

  private

  def color_code_workload
    assert_equal(expected, "ResistorColor.color_code(#{color.inspect})")
  end

  def colors_workload
    [
      "expected = #{expected}",
      "assert_equal expected, ResistorColor.colors"
    ]
  end
end

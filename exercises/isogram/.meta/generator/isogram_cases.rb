require 'generator/exercise_case'

class IsogramCase < Generator::ExerciseCase

  def workload
    indent_lines(
      [
        "string = #{input.inspect}",
        "#{assert} Isogram.is_isogram?(string)"
      ], 4
    )
  end

end

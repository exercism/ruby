require 'generator/exercise_case'

class IsogramCase < Generator::ExerciseCase

  def workload
    indent_lines(
      [
        "string = #{input.inspect}",
        "#{assert} Isogram.isogram?(string), #{failure_message}"
      ], 4
    )
  end

  private

  def failure_message
    %Q("Expected '#{expected}', '#{input}' #{type}")
  end

  def type
    "#{expected ? 'is' : 'is not'} an isogram"
  end

end

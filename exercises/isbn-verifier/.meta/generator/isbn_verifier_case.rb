require 'generator/exercise_case'

class IsbnVerifierCase < Generator::ExerciseCase

  def workload
    indent_lines(
      [
        "string = #{input.inspect}",
        "#{assert} IsbnVerifier.valid?(string), #{failure_message}"
      ], 4
    )
  end

  private

  def failure_message
    %Q("Expected #{expected}, #{reason}")
  end

  def reason
    "'\#{string}' #{is_or_not} a valid isbn"
  end

  def is_or_not
    expected ? 'is' : 'is not'
  end

end
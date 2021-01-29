require 'generator/exercise_case'

class IsbnVerifierCase < Generator::ExerciseCase

  def workload
    [
      "string = #{isbn.inspect}",
      assert_or_refute(expected, "IsbnVerifier.valid?(string), #{failure_message}")
    ]
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

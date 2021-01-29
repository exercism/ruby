require 'generator/exercise_case'

class IsogramCase < Generator::ExerciseCase
  def workload
    [
      "input = #{phrase.inspect}",
      assert_or_refute(expected, "Isogram.isogram?(input), #{failure_message}")
    ]
  end

  private

  def failure_message
    %Q("Expected #{expected}, #{reason}")
  end

  def reason
    "'\#{input}' #{is_or_not} an isogram"
  end

  def is_or_not
    expected ? 'is' : 'is not'
  end
end

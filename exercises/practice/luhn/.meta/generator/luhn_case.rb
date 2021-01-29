require 'generator/exercise_case'

class LuhnCase < Generator::ExerciseCase
  def workload
    assert_or_refute(expected, "Luhn.valid?(#{input_value.inspect})")
  end
end

require 'generator/exercise_cases'

class LuhnCase < ExerciseCase
  def workload
    "#{assert} Luhn.valid?(#{input.inspect})"
  end
end

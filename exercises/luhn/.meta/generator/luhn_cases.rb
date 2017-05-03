require 'generator/exercise_case'

class LuhnCase < Generator::ExerciseCase
  def workload
    "#{assert} Luhn.valid?(#{input.inspect})"
  end
end

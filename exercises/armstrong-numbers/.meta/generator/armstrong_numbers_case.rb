require 'generator/exercise_case'

class ArmstrongNumbersCase < Generator::ExerciseCase

  def workload
    assert_or_refute(expected, call_armstrong)
  end

  def call_armstrong
    "ArmstrongNumbers.include?(#{underscore(input['number'])})"
  end
end

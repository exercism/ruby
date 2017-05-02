require 'generator/exercise_cases'

class LeapCase < Generator::ExerciseCase

  def workload
    "#{assert} Year.leap?(#{input.inspect})"
  end

  def failure_message
    "Expected '#{expected}', #{input} is #{expected ? '' : 'not '}a leap year."
  end
end

require 'generator/exercise_case'

class LeapCase < Generator::ExerciseCase
  def workload
    assert_or_refute(expected, "Year.leap?(#{input_year.inspect}), #{failure_message.inspect}")
  end

  def failure_message
    "Expected '#{expected}', #{input_year} is #{expected ? '' : 'not '}a leap year."
  end
end

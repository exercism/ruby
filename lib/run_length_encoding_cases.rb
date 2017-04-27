require 'exercise_cases'

class RunLengthEncodingCase < ExerciseCase

  def assign_input
    "input = '#{input}'"
  end

  def assign_output
    "output = '#{expected}'"
  end

  def assertion
    if property == 'consistency'
      'assert_equal output,
                 RunLengthEncoding.decode(RunLengthEncoding.encode(input))'
    else
      "assert_equal output, RunLengthEncoding.#{property}(input)"
    end
  end

end

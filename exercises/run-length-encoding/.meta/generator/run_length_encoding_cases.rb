require 'generator/exercise_case'

class RunLengthEncodingCase < Generator::ExerciseCase

  def name
    super.sub('test_',"test_#{property}_")
  end

  def workload
    indent_lines([
      "input = '#{input}'",
      "output = '#{expected}'",
      assertion
    ], 4)
  end

  private

  def assertion
    if property == 'consistency'
      'assert_equal output,
                 RunLengthEncoding.decode(RunLengthEncoding.encode(input))'
    else
      "assert_equal output, RunLengthEncoding.#{property}(input)"
    end
  end

end

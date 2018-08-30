require 'generator/exercise_case'

class RunLengthEncodingCase < Generator::ExerciseCase
  def workload
    send("#{property}_assertion")
  end

  def test_name
    super.sub('test_',"test_#{property}_")
  end

  private

  def standard_assertion
    [
      "input = '#{string}'",
      "output = '#{expected}'",
      "assert_equal output, RunLengthEncoding.#{property}(input)"
    ]
  end

  alias_method :encode_assertion, :standard_assertion
  alias_method :decode_assertion, :standard_assertion

  def consistency_assertion
    [
      "input = '#{string}'",
      "encoded = RunLengthEncoding.encode(input)",
      "assert_equal input, RunLengthEncoding.decode(encoded)"
    ]
  end
end

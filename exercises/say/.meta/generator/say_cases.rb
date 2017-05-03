require 'generator/exercise_case'

class SayCase < Generator::ExerciseCase

  def workload
    [
      "question = #{underscore_format(input)}",
      indent(4, assertion),
    ].join("\n")
  end

  private

  def indent(size, lines)
    lines.lines.each_with_object('') { |line, obj| obj << ' ' * size + line }
  end

  def assertion
    return error_assertion if expected == -1

    "assert_equal('#{expected}', Say.new(question).in_english)"
  end

  def error_assertion
    [
      'assert_raises ArgumentError do',
      indent(2, 'Say.new(question).in_english'),
      'end',
    ].join("\n")
  end

  def underscore_format(number)
    number.to_s.reverse.gsub(/...(?=.)/, '\&_').reverse
  end
end

require 'generator/exercise_case'

class ClockCase < Generator::ExerciseCase
  def name
    'test_%s' % description
                .gsub(/[() -]/, '_')
                .gsub('=', 'is_equal_to')
                .chomp('_')
  end

  def workload
    case property
    when 'create' then simple_test
    when 'add' then add_to_clock
    when 'subtract' then subtract_from_clock
    when 'equal' then compare_clocks
    else
      raise "Encountered unknown property in canonical-data.json"
    end
  end

  private

  def compare_clocks
    first_hour = input['clock1']['hour']
    first_minute = input['clock1']['minute']
    second_hour = input['clock2']['hour']
    second_minute = input['clock2']['minute']

    indent_lines(
      [
        "clock1 = Clock.new(hour: #{first_hour}, minute: #{first_minute})",
        "clock2 = Clock.new(hour: #{second_hour}, minute: #{second_minute})",
        "#{assert} clock1 == clock2"
      ], 4
    )
  end

  def simple_test
    keyword_arguments = %w[hour minute].map { |key| [key, input[key]] }
    keyword_arguments.reject! { |_, value| value.zero? }
    keyword_arguments.map! { |key, value| "#{key}: #{value}" }

    clock_builder = "Clock.new(#{keyword_arguments.join(', ')}).to_s"
    indent_text(4, "assert_equal #{expected.inspect}, #{clock_builder}")

  end

  def add_to_clock
    clock1 = "clock1 = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})"
    add = "(clock1 + Clock.new(minute: #{input['value']})).to_s"
    indent_lines(
      [
        "#{clock1}",
        "assert_equal #{expected.inspect}, #{add}"
      ], 4
    )
  end

  def subtract_from_clock
    clock1 = "clock1 = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})"
    subtract = "(clock1 - Clock.new(minute: #{input['value']})).to_s"
    indent_lines(
      [
        "#{clock1}",
        "assert_equal #{expected.inspect}, #{subtract}"
      ], 4
    )
  end
end

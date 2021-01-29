require 'generator/exercise_case'

class ClockCase < Generator::ExerciseCase

  def workload
    case property
    when 'create' then simple_test
    when 'add' then add_to_clock
    when 'subtract' then subtract_from_clock
    when 'equal' then compare_clocks
    else
      fail "Encountered unknown property in canonical-data.json"
    end
  end

  def description
    super.gsub('=', 'is_equal_to').gsub(/\(.*\)/,'')
  end

  private

  def compare_clocks
    [
      "clock1 = Clock.new(hour: #{clock1['hour']}, minute: #{clock1['minute']})\n",
      "clock2 = Clock.new(hour: #{clock2['hour']}, minute: #{clock2['minute']})\n",
      assert_or_refute(expected, "clock1 == clock2")
    ].join
  end

  def simple_test
    keyword_arguments = %w(hour minute).map { |key| [key, input[key]] }
    keyword_arguments.reject! { |_, value| value.zero? }
    keyword_arguments.map! { |key, value| "#{key}: #{value}" }

    assert_equal(expected, "Clock.new(#{keyword_arguments.join(', ')}).to_s")
  end

  def add_to_clock
    [
      "clock1 = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})\n",
      assert_equal(expected, "(clock1 + Clock.new(minute: #{input['value']})).to_s")
    ].join
  end

  def subtract_from_clock
    [
      "clock1 = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})\n",
      assert_equal(expected, "(clock1 - Clock.new(minute: #{input['value']})).to_s")
    ].join
  end
end

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
    when 'create'
      simple_test
    when 'add'
      add_to_clock
    when 'subtract'
      subtract_from_clock
    when 'equal'
      compare_clocks
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

    "clock1 = Clock.new(hour: #{first_hour}, minute: #{first_minute})
    clock2 = Clock.new(hour: #{second_hour}, minute: #{second_minute})
    #{assert} clock1 == clock2"
  end

  def simple_test
    [
      "assert_equal #{expected.inspect}, ",
      "Clock.new(#{"hour: #{input['hour']}" unless input['hour'] == 0}",
      "#{", " unless input['hour'] == 0 || input['minute'] == 0}",
      "#{"minute: #{input['minute']}" unless input['minute'] == 0}).to_s"
    ].join
  end

  def add_to_clock
    "clock1 = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})
    assert_equal #{expected.inspect}, (clock1 + Clock.new(minute: #{input['value']})).to_s"
  end

  def subtract_from_clock
    "clock1 = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})
    assert_equal #{expected.inspect}, (clock1 - Clock.new(minute: #{input['value']})).to_s"
  end
end

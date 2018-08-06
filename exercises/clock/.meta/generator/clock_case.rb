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
    "clock1 = Clock.new(hour: #{input['clock1']['hour']}, minute: #{input['clock1']['minute']})
    clock2 = Clock.new(hour: #{input['clock2']['hour']}, minute: #{input['clock2']['minute']})
    #{assert} clock1 == clock2"
  end

  def simple_test
    "assert_equal #{expected.inspect}, Clock.new(hour: #{input['hour']}, minute: #{input['minute']}).to_s"
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

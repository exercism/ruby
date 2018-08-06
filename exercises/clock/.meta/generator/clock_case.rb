require 'generator/exercise_case'

class ClockCase < Generator::ExerciseCase
  def name
    'test_%s' % description
                .gsub(/[() -]/, '_')
                .gsub('=', 'is_equal_to')
                .chomp('_')
  end

  def workload
    if property == 'create'
      simple_test
    elsif property == 'add minutes'
      add_to_clock
    else
      compare_clocks
    end
  end

  private

  def compare_clocks
    "clock1 = Clock.new(hour: #{clock1['hour']}, minute: #{clock1['minute']})
    clock2 = Clock.new(hour: #{clock2['hour']}, minute: #{clock2['minute']})
    #{assert} clock1 == clock2"
  end

  def simple_test
    "assert_equal #{expected.inspect}, Clock.new(hour: #{input['hour']}, minute: #{input['minute']}).to_s"
  end

  def add_to_clock
    "clock = Clock.new(hour: #{input['hour']}, minute: #{input['minute']})
    clock + Clock.new(minute: #{input['value']})
    assert_equal #{expected.inspect}, clock.to_s"
  end

end

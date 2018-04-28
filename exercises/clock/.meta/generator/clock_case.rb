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
    when 'add' then arithmetic_test('+', add)
    when 'create' then create_test
    when 'equal' then compare_clocks
    when 'subtract' then arithmetic_test('-', subtract)
    end
  end

  private

  ASSERTION_STR = 'assert_equal %s'
  CLOCK_STR = 'Clock.at(%d, %d)'

  def compare_clocks
    "clock1 = Clock.at(#{clock1['hour']}, #{clock1['minute']})
    clock2 = Clock.at(#{clock2['hour']}, #{clock2['minute']})
    #{assert} clock1 == clock2"
  end

  def create_test
    "#{ASSERTION_STR}, #{CLOCK_STR}.to_s" % [expected.inspect, hour, minute]
  end

  def arithmetic_test(op, value)
    "#{ASSERTION_STR}, (#{CLOCK_STR} #{op} #{value}).to_s" % [expected.inspect, hour, minute]
  end
end

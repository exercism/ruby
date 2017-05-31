require 'generator/exercise_case'

class ClockCase < Generator::ExerciseCase
  def name
    'test_%s' % description
                .gsub(/[() -]/, '_')
                .gsub('=', 'is_equal_to')
                .chomp('_')
  end

  def workload
    property == 'equal' ? compare_clocks : simple_test
  end

  private

  def compare_clocks
    "clock1 = Clock.at(#{clock1['hour']}, #{clock1['minute']})
    clock2 = Clock.at(#{clock2['hour']}, #{clock2['minute']})
    #{assert} clock1 == clock2"
  end

  def simple_test
    [
      "assert_equal #{expected.inspect}, ",
      "#{'(' if add_to_clock}Clock.at(#{hour}, ",
      "#{minute})#{add_to_clock}#{')' if add_to_clock}.to_s"
    ].join
  end

  def add_to_clock
    " + #{add}" if respond_to?(:add)
  end

end

require 'generator/exercise_case'

class ClockCase < Generator::ExerciseCase
  def name
    'test_%s' % canonical.description
                .gsub(/[() -]/, '_')
                .gsub('=', 'is_equal_to')
                .chomp('_')
  end

  def workload
    canonical.property == 'equal' ? compare_clocks : simple_test
  end

  private

  def compare_clocks
    "clock1 = Clock.at(#{canonical.clock1['hour']}, #{canonical.clock1['minute']})
    clock2 = Clock.at(#{canonical.clock2['hour']}, #{canonical.clock2['minute']})
    #{assert} clock1 == clock2"
  end

  def simple_test
    [
      "assert_equal #{canonical.expected.inspect}, ",
      "#{'(' if add_to_clock}Clock.at(#{canonical.hour}, ",
      "#{canonical.minute})#{add_to_clock}#{')' if add_to_clock}.to_s"
    ].join
  end

  def add_to_clock
    " + #{canonical.add}" if canonical.add
  end

end

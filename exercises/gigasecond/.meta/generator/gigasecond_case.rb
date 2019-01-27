require 'generator/exercise_case'
require 'time'

class GigasecondCase < Generator::ExerciseCase
  def workload
    %Q(assert_equal #{want}, Gigasecond.from(#{got}))
  end

  private

  def got
    "Time.utc(#{start_values.join(', ')})"
  end

  def want
    "Time.utc(#{stop_values.join(', ')})"
  end

  def start_values
    ts = Time.parse(moment)
    [ts.year, ts.month, ts.day, ts.hour, ts.min, ts.sec]
  end

  def stop_values
    ts = Time.parse(expected)
    [ts.year, ts.month, ts.day, ts.hour, ts.min, ts.sec]
  end
end

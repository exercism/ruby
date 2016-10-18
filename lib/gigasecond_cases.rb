require 'time'

class GigasecondCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ :-]/, '_')
  end

  def workload
    <<-WL.chomp
result = Gigasecond.from(#{got})
    assert_equal #{want}, result
    WL
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def description
    send(:'#') || input
  end

  def got
    "Time.utc(#{start_values.join(', ')})"
  end

  def want
    "Time.utc(#{stop_values.join(', ')})"
  end

  def start_values
    ts = Time.parse(input)
    [ts.year, ts.month, ts.day, ts.hour, ts.min, ts.sec]
  end

  def stop_values
    ts = Time.parse(expected)
    [ts.year, ts.month, ts.day, ts.hour, ts.min, ts.sec]
  end
end

GigasecondCases = proc do |data|
  JSON.parse(data)['add']['cases'].map.with_index do |row, i|
    GigasecondCase.new(row.merge('index' => i))
  end
end

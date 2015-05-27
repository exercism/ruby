require 'time'

class GigasecondCase < OpenStruct
  def name
    'test_%s' % description.gsub(/[ :-]/, '_')
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

  def skipped?
    index > 0
  end
end

GigasecondCases = proc do |data|
  JSON.parse(data)['add']['cases'].map.with_index do |row, i|
    GigasecondCase.new(row.merge('index' => i))
  end
end

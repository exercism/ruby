class LeapCase < OpenStruct
  def test_name
    'test_%s' % description.downcase.gsub(/[ -]/, '_')
  end

  def workload
    assertion = "Year.leap?(#{input})"
    if expected
      "assert #{assertion}, #{failure_message.inspect}"
    else
      "refute #{assertion}, #{failure_message.inspect}"
    end
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def failure_message
    "Expected '#{expected}', #{input} is #{expected ? '' : 'not '}a leap year."
  end
end

LeapCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    LeapCase.new(row.merge('index' => i))
  end
end

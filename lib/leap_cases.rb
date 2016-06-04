class LeapCase < OpenStruct
  def name
    'test_%s' % description.downcase.gsub(/[ -]/, '_')
  end

  def do
    "Year.leap?(#{input})"
  end

  def skipped?
    index > 0
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

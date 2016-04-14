class RunLengthEncodingCase < OpenStruct
  def name
    'test_%s' % cleaned_description
  end

  def cleaned_description
    description.gsub(/\W+/, '_').squeeze('_')
  end

  def do
    case description
    when /decode.+encode/
      'RunLengthEncoding.undo(RunLengthEncoding.do(input))'
    when /encode/
      'RunLengthEncoding.do(input)'
    when /decode/
      'RunLengthEncoding.undo(input)'
    end
  end

  def skipped?
    index > 0
  end
end

RunLengthEncodingCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RunLengthEncodingCase.new(row.merge('index' => i))
  end
end

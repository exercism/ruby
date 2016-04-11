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
      'RunLength.decode(RunLength.encode(input))'
    when /encode/
      'RunLength.encode(input)'
    when /decode/
      'RunLength.decode(input)'
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

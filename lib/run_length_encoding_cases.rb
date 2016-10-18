class RunLengthEncodingCase < OpenStruct
  def test_name
    'test_%s' % cleaned_description
  end

  def work_load
    case description
    when /decode.+encode/
      "assert_equal #{expected},
                 RunLengthEncoding.decode(RunLengthEncoding.encode(#{input}))"
    when /encode/
      "assert_equal #{expected}, RunLengthEncoding.encode(#{input})"
    when /decode/
      "assert_equal #{expected}, RunLengthEncoding.decode(#{input})"
    end
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  # internal

  def cleaned_description
    description.gsub(/\W+/, '_').squeeze('_')
  end
end

RunLengthEncodingCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RunLengthEncodingCase.new(row.merge('index' => i))
  end
end

class RunLengthEncodingCase < OpenStruct
  def test_name
    'test_%s' % cleaned_description
  end

  def workload
    <<-WL.chomp
input = '#{input}'
    output = '#{expected}'
    #{assertion}
    WL
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def assertion
    case description
    when /decode.+encode/
      "assert_equal output,
                 RunLengthEncoding.decode(RunLengthEncoding.encode(input))"
    when /encode/
      "assert_equal output, RunLengthEncoding.encode(input)"
    when /decode/
      "assert_equal output, RunLengthEncoding.decode(input)"
    end
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

require 'exercise_cases'

class RunLengthEncodingCase < OpenStruct
  def name
    'test_%s' % cleaned_description
  end

  def assign_input
    "input = '#{input}'"
  end

  def assign_output
    "output = '#{expected}'"
  end

  def assertion
    case description
    when /decode.+encode/
      'assert_equal output,
                 RunLengthEncoding.decode(RunLengthEncoding.encode(input))'
    when /encode/
      'assert_equal output, RunLengthEncoding.encode(input)'
    when /decode/
      'assert_equal output, RunLengthEncoding.decode(input)'
    end
  end

  def skipped?
    index > 0
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

require 'exercise_cases'

class HammingCase < OpenStruct
  def name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    "Hamming.compute('#{strand1}', '#{strand2}')"
  end

  def raises_error?
    expected.to_i == -1
  end

  def skipped
    index.zero? && '# skip' ||
      'skip'
  end
end

HammingCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    HammingCase.new(row.merge('index' => i))
  end
end

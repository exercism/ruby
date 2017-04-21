require 'exercise_cases'

class RnaTranscriptionCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    "Complement.of_dna('#{dna}')"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

RnaTranscriptionCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RnaTranscriptionCase.new(row.merge('index' => i))
  end
end

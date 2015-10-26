class RnaTranscriptionCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def do
    if defined?(rna)
      "Complement.of_rna('#{rna}')"
    else
      "Complement.of_dna('#{dna}')"
    end
  end

  def raises_error?
    expected == null
  end

  def skipped?
    index > 0
  end
end

RnaTranscriptionCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RnaTranscriptionCase.new(row.merge('index' => i))
  end
end

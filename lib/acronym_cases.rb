class AcronymCase < OpenStruct
  def test_name
    'test_%s' % description.tr(' ', '_')
  end

  def workload
    "assert_equal '#{expected}', Acronym.abbreviate('#{phrase}')"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

AcronymCases = proc do |data|
  JSON.parse(data)['abbreviate']['cases'].map.with_index do |row, i|
    AcronymCase.new(row.merge('index' => i))
  end
end

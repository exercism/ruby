class HammingCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    assertion = "Hamming.compute('#{strand1}', '#{strand2}')"
    if raises_error?
      "assert_raises(ArgumentError) { #{assertion} }"
    else
      "assert_equal #{expected}, #{assertion}"
    end    
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def raises_error?
    expected.to_i == -1
  end
end

HammingCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    HammingCase.new(row.merge('index' => i))
  end
end

class NthPrimeCase < OpenStruct
  def test_name
    'test_%s' % description.downcase.gsub(/[ -]/, '_')
  end

  def workload
    actual = "Prime.nth(#{input})"
    if raises_error?
      "assert_raises(ArgumentError) { #{actual} }"
    else
      "assert_equal #{expected}, #{actual}"
    end
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def raises_error?
    expected == false
  end
end

NthPrimeCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    NthPrimeCase.new(row.merge('index' => i))
  end
end

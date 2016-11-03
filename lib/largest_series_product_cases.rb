class LargestSeriesProductCase < OpenStruct
  def test_name
    'test_%s' % description.tr('()', '').tr(' -', '_').downcase
  end

  def workload
    assertion = "Series.new('#{digits}').largest_product(#{span})"
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

LargestSeriesProductCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    LargestSeriesProductCase.new(row.merge('index' => i))
  end
end

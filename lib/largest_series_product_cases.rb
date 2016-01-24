class LargestSeriesProductCase < OpenStruct
  def name
    'test_%s' % description.tr('()', '').tr(' -', '_').downcase
  end

  def do
    "Series.new('#{digits}').largest_product(#{span})"
  end

  def raises_error?
    expected.to_i == -1
  end

  def skipped?
    index > 0
  end
end

LargestSeriesProductCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    LargestSeriesProductCase.new(row.merge('index' => i))
  end
end

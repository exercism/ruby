class AlphameticsCase < OpenStruct
  PAIRS_PER_LINE = 4

  def test_name
    "test_#{description.tr(' ', '_')}"
  end

  def work_load
    "Alphametics.new.solve('#{puzzle}')"
  end

  def expected_values
    expected.each_slice(PAIRS_PER_LINE).map do |pairs|
      '      %s' % pairs.map { |k, v| "'#{k}' => #{v}" }.join(', ')
    end.join(",\n")[0..-1]
  end

  def skipped?
    index > 0
  end
end

AlphameticsCases = proc do |data|
  JSON.parse(data)['solve']['cases'].map.with_index do |row, i|
    row = row.merge('index' => i)
    AlphameticsCase.new(row)
  end
end

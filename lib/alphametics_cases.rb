class AlphameticsCase < OpenStruct
  PAIRS_PER_LINE = 4
  SPACE = ->(num) { ' ' * num }

  def test_name
    "test_#{description.tr(' ', '_')}"
  end

  def work_load
    "assert_equal(#{expect}, Alphametics.new.solve('#{puzzle}'))"
  end

  def expect
    return 'nil' if expected.nil?
    expected_values
  end

  def expected_values
    "{\n" << expected.each_slice(PAIRS_PER_LINE).map do |pairs|
      '%s'.prepend(SPACE[6]) %
      pairs.map { |k, v| "'#{k}' => #{v}" }.join(', ')
    end.join(",\n") << "\n    }"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

AlphameticsCases = proc do |data|
  JSON.parse(data)['solve']['cases'].map.with_index do |row, i|
    row = row.merge('index' => i)
    AlphameticsCase.new(row)
  end
end

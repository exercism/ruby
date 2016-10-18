class RomanNumeralsCase < OpenStruct
  def test_name
    'test_%s' % number.to_s
  end

  def work_load
    "assert_equal '#{expected}', #{'%s.to_roman' % number.to_s}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

RomanNumeralsCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RomanNumeralsCase.new(row.merge('index' => i))
  end
end

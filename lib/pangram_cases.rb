class PangramCase < OpenStruct
  def test_name
    'test_%s' % description.delete("'").gsub(/[ -]/, '_')
  end

  def work_load
    if expected
      "assert Pangram.is_pangram?('#{input}')"
    else
      "refute Pangram.is_pangram?('#{input}')"
    end
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

PangramCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    PangramCase.new(row.merge('index' => i))
  end
end

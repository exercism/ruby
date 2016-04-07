class PangramCase < OpenStruct
  def name
    'test_%s' % description.delete("'").gsub(/[ -]/, '_')
  end

  def do
    'Pangram.is_pangram?(str)'
  end

  def skipped?
    index > 0
  end
end

PangramCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    PangramCase.new(row.merge('index' => i))
  end
end

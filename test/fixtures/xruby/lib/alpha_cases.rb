class AlphaCase < OpenStruct

  def name
    format('test_%s', description.downcase.gsub(/[ -]/, '_'))
  end

  def assertion
    expected ? 'assert' : 'refute'
  end

  def skip
    index.zero? ? '# skip' : 'skip'
  end
end

AlphaCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    AlphaCase.new(row.merge('index' => i))
  end
end

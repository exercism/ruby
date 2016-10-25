class IsogramCase < OpenStruct

  def name
    format('test_%s', description)
  end

  def description
    input.downcase.gsub(/[ -]/,'_')
  end

  def assertion
    expected ? 'assert' : 'refute'
  end

  def skip
    index.zero? ? '# skip' : 'skip'
  end
end

IsogramCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    IsogramCase.new(row.merge('index' => i))
  end
end

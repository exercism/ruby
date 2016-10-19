class WordCountCase < OpenStruct
  def name
    'test_%s' % description.tr(' ', '_')
  end

  def object_under_test
    %Q(Phrase.new("#{input}"))
  end

  def skipped?
    index.nonzero?
  end
end

WordCountCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    WordCountCase.new(row.merge('index' => i))
  end
end

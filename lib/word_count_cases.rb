class WordCountCase < OpenStruct
  def test_name
    'test_%s' % description.tr(' ', '_')
  end

  def workload
    <<-WL.chomp
phrase = Phrase.new(#{input.inspect})
    counts = #{expected}
    assert_equal counts, phrase.word_count
    WL
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

WordCountCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    WordCountCase.new(row.merge('index' => i))
  end
end

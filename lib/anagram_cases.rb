class AnagramCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    indent_lines([show_comment, detector, anagram, assert].compact)
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def indent_lines(code, indent = 2)
    code.join("\n" + ' '*2*indent)
  end

  def show_comment
    "# #{comment}" unless comment.nil?
  end

  def detector
    "detector = Anagram.new('#{subject}')"
  end

  def anagram
    "anagrams = detector.match(#{candidates})"
  end

  def assert
    actual = expected.size > 1 ? 'anagrams.sort' : 'anagrams'
    "assert_equal #{expected.sort}, #{actual}"
  end
end

AnagramCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    AnagramCase.new(row.merge('index' => i))
  end
end

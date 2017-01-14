require 'exercise_cases'

class WordyCase < OpenStruct
  def test_name
    'test_%s' % description.downcase.tr(' ', '_')
  end

  def workload
    [
      "question = '#{input}'",
      indent(4, assertion),
    ].join("\n")
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def indent(size, lines)
    lines.lines.each_with_object('') { |line, obj| obj << ' ' * size + line }
  end

  def assertion
    return error_assertion unless expected
    return message_assertion if message

    "assert_equal(#{expected}, WordProblem.new(question).answer)"
  end

  def error_assertion
    [
      'assert_raises ArgumentError do',
      indent(2, 'WordProblem.new(question).answer'),
      'end',
    ].join("\n")
  end

  def message_assertion
    [
      'answer = WordProblem.new(question).answer',
      "message = \"#{message % '#{answer}'}\"",
      "assert_equal(#{expected}, answer, message)",
    ].join("\n")
  end
end

class WordyCase::PreProcessor
  class << self
    def call(row)
      row.merge('message' => message_for(row))
    end

    private

    def message_for(row)
      return unless row['input'] == 'What is -3 plus 7 multiplied by -2?'

      'You should ignore order of precedence. -3 + 7 * -2 = -8, not %s'
    end
  end
end

WordyCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    WordyCase.new(WordyCase::PreProcessor.call(row).merge(index: i))
  end
end

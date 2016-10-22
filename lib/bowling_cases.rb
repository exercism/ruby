class BowlingCase < OpenStruct
  def test_name
    "test_#{description.downcase.tr(' ', '_')}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def work_load
    indent_lines(assert)
  end

  private

  def roll
    "roll(#{rolls})"
  end

  def assert
    if assert_error?
      [
        'assert_raises StandardError do',
        "  #{roll}",
        '  @game.score',
        'end'
      ]
    else
      [roll, "assert_equal #{expected}, @game.score"]
    end
  end

  def assert_error?
    expected == -1
  end

  def indent_lines(code)
    code.join("\n" + ' ' * 4)
  end
end

BowlingCases = proc do |data|
  JSON.parse(data)['score']['cases'].map.with_index do |row, i|
    BowlingCase.new(row.merge('index' => i))
  end
end

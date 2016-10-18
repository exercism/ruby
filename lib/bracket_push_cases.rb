class BracketPushCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def work_load
    long_input? ? split_test : simple_test
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def long_input?
    input.length > 80
  end

  def simple_test
    "#{assert_or_refute} Brackets.paired?('#{input}')"
  end

  def split_test
    "str = '#{split_input[0]}'\\
          '#{split_input[1]}'
    #{assert_or_refute} Brackets.paired?(str)"
  end

  def assert_or_refute
    expected ? 'assert' : 'refute'
  end

  def split_input
    @split_input ||= input.scan(/.{1,#{input.length / 2}}/)
  end
end

BracketPushCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    BracketPushCase.new(row.merge('index' => i))
  end
end

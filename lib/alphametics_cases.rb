class AlphameticsCase < OpenStruct
  def test_name
    "test_#{description.tr(' ', '_')}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def input
    "'#{puzzle}'"
  end

  def expect
    expected.nil? ? {} : expected_values
  end

  def workload
    body = [
      'input = %s' % input,
      'expected = %s' % expect,
      'assert_equal expected, Alphametics.solve(input)'
    ]
    indent(body,4)
  end

  def runtime_comment
    if slow?
      comments = 
        '',
        '# The obvious algorithm can take a long time to solve this puzzle,',
        '# but an optimised solution can solve it fairly quickly.',
        '# (It\'s OK to submit your solution without getting this test to pass.)'
      indent(comments,2)
    end
  end

  private

  def slow?
    (expected||{}).size > 7 
  end

  def expected_values
    "{ #{indent(expected_values_as_lines,17)} }"
  end

  def expected_values_as_lines
    lines = expected_values_as_strings.each_slice(4).map { |line| line.join(', ') }
    add_trailing_comma(lines)
  end

  def expected_values_as_strings
    expected.sort.map { |(key,value)| "'#{key}' => #{value}" }
  end

  def add_trailing_comma(lines)
    lines[0...-1].map { |line| "#{line}," }.push(lines.last)
  end

  def indent(lines, spaces)
    lines.join("\n" + ' ' * spaces)
  end

end

AlphameticsCases = proc do |data|
  testcases = JSON.parse(data)['solve']['cases'].map.with_index do |row, i|
    row = row.merge('index' => i)
    AlphameticsCase.new(row)
  end

  # The example algorithm takes a long time to solve these.
  # testcases.reject { |testcase| (testcase.expected||{}).size > 7 }
end

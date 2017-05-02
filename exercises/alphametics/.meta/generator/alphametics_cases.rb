require 'generator/exercise_cases'

class AlphameticsCase < Generator::ExerciseCase
  def workload
    body =
      "input = %s\n" % input,
      "expected = %s\n" % expect,
      "assert_equal expected, Alphametics.solve(input)"
    indent(body, 4)
  end

  def runtime_comment
    if slow?
      comments =
        '',
        "# The obvious algorithm can take a long time to solve this puzzle,\n",
        "# but an optimised solution can solve it fairly quickly.\n",
        "# (It's OK to submit your solution without getting this test to pass.)\n"
      indent(comments, 2)
    end
  end

  private

  def input
    "'#{puzzle}'"
  end

  def expect
    expected.nil? ? {} : expected_values
  end

  def slow?
    (expected||{}).size > 7
  end

  def expected_values
    "{ #{indent(expected_values_as_lines, 17)} }"
  end

  def expected_values_as_lines
    lines = expected_values_as_strings.each_slice(4).map { |line| line.join(', ') }
    add_trailing_comma_and_newline(lines)
  end

  def expected_values_as_strings
    expected.sort.map { |(key, value)| "'#{key}' => #{value}" }
  end

  def add_trailing_comma_and_newline(lines)
    lines[0...-1].map { |line| "#{line},\n" }.push(lines.last)
  end

  def indent(lines, spaces)
    lines.join(' ' * spaces)
  end

end

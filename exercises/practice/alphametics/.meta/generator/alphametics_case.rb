require 'generator/exercise_case'

class AlphameticsCase < Generator::ExerciseCase
  def to_s(index)
    indent_by(2, runtime_comment) + super(index)
  end

  def test_name
    super.sub(/(test_puzzle_with_ten_letters_and_199_addends)/, 'do_not_\1')
    ## Remove 'do_not_' from the test name to run this test.
  end

  def workload
    [
      "puzzle = #{format_puzzle}\n",
      "expected = #{format_expected}\n",
      "assert_equal expected, Alphametics.solve(puzzle)\n"
    ].join
  end

  private

  def runtime_comment
    comment = ''
    if slow?
      comment += [
        "# The obvious algorithm can take a long time to solve this puzzle,\n",
        "# but an optimised solution can solve it fairly quickly.\n",
        "# (It's OK to submit your solution without getting this test to pass.)\n",
      ].join
    end

    if test_name == "do_not_test_puzzle_with_ten_letters_and_199_addends"
      comment += "#\n# Remove 'do_not_' from the test name to run this test.\n"
    end

    comment
  end

  def slow?
    expected && expected.size > 7
  end

  def format_puzzle
    "'#{puzzle}'"
  end

  def format_expected
    return "{}" if expected.nil?

    pairs =  expected.sort.map { |(key, value)| "'#{key}' => #{value}" }
    groups = pairs.each_slice(4).map { |pair| pair.join(', ') }

    indented_groups = indent_by(13, groups.join(",\n"))
    # Strip the first indenting spaces.
    indented_groups.sub!(/^ {13}/,'')

    "{ #{indented_groups} }"
  end
end

require 'generator/exercise_case'

class GrepCase < Generator::ExerciseCase
  def workload
    [
      "pattern = #{pattern.inspect}",
      "flags = #{flags}",
      "files = #{files}",
      "expected = #{indent_heredoc(expected, 'EXPECTED', 2, '.rstrip')}",
      "",
      "assert_equal expected, Grep.grep(pattern, flags, files)"
    ]
  end
end

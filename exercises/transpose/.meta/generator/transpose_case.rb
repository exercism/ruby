require 'generator/exercise_case'

class TransposeCase < Generator::ExerciseCase

  def workload
    [
      "input = #{indent_heredoc(input_lines, 'INPUT', 2, delimiter_mod)}",
      "",
      "expected = #{indent_heredoc(expected, 'EXPECTED', 2, delimiter_mod)}",
      "",
      "assert_equal expected, Transpose.transpose(input)",
    ]
  end

  private

  def delimiter_mod
    ".strip"
  end

end

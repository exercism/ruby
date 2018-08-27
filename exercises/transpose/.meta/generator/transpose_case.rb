require 'generator/exercise_case'

class TransposeCase < Generator::ExerciseCase

  def workload
    %Q(input = #{indent_heredoc(input_lines, 'INPUT', 6, delimiter_mod)}\n) +
      %Q(    actual = Transpose.transpose(input)\n) +
      %Q(    expected = #{indent_heredoc(expected, 'EXPECTED', 6, delimiter_mod)}\n) +
    '    assert_equal expected.strip, actual'
  end

  private

  def delimiter_mod
    ".gsub(/^ {6}/, '')"
  end

end

require 'generator/exercise_cases'

class TransposeCase < Generator::ExerciseCase

  def workload
    'Transpose.transpose(input)'
  end

  def expect
    indented_heredoc(expected, 'EXPECTED')
  end

  def input_text
    indented_heredoc(input, 'INPUT')
  end

  private

  def indented_heredoc(string, delimiter)
    [
      "<<-#{delimiter}.gsub(/^ {6}/, '')",
      indent_lines(string),
      indent_line(delimiter)
    ].join("\n")
  end

  def indent_lines(lines, indent = 3)
    lines.map { |line| indent_line(line, indent) }.join("\n")
  end

  def indent_line(line, indent = 2)
    ' ' * indent * 2 + line
  end
end

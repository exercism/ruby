require 'exercise_cases'

class TournamentCase < ExerciseCase

  def workload
    'Tournament.tally(input)'
  end

  def expect
    indented_heredoc(expected, 'TALLY')
  end

  def input_text
    indented_heredoc(input, 'INPUT')
  end

  private

  def indented_heredoc(string, delimiter)
    [
      "<<-#{delimiter}.gsub(/^ */, '')",
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

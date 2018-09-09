require 'generator/exercise_case'

class TournamentCase < Generator::ExerciseCase
  def workload
    [
      "input = #{indent_heredoc(rows, 'INPUT', 0, delimiter_mod)}\n\n",
      "expected = #{indent_heredoc(expected, 'TALLY', 0, delimiter_mod)}\n\n",
      "assert_equal expected, Tournament.tally(input)"
    ]
  end

  private

  def delimiter_mod
    ".gsub(/^ */, '')"
  end
end

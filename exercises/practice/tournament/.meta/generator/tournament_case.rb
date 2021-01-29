require 'generator/exercise_case'

class TournamentCase < Generator::ExerciseCase
  def workload
    [
      "input = #{indent_heredoc(rows, 'INPUT')}\n\n",
      "expected = #{indent_heredoc(expected, 'TALLY')}\n\n",
      "assert_equal expected, Tournament.tally(input)"
    ]
  end
end

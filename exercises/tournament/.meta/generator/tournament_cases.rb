require 'generator/exercise_cases'

class TournamentCase < Generator::ExerciseCase

  def workload
    %Q(input = #{indented_heredoc(input, 'INPUT', 0, delimiter_mod)}\n) +
      %Q(    actual = Tournament.tally(input)\n) +
      %Q(    expected = #{indented_heredoc(expected, 'TALLY', 0, delimiter_mod)}\n) +
      '    assert_equal expected, actual'
  end

  private

  def delimiter_mod
    ".gsub(/^ */, '')"
  end
end

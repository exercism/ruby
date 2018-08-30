require 'generator/exercise_case'

class BeerSongCase < Generator::ExerciseCase
  def workload
    [
      "expected = #{indent_heredoc(expected, 'TEXT', 0, ".gsub(/^ */, '')" )}\n",
      "assert_equal expected, BeerSong.recite(#{start_bottles}, #{take_down})\n"
    ].join
  end
end

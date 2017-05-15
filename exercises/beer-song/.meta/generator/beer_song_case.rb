require 'generator/exercise_case'

class BeerSongCase < Generator::ExerciseCase
  def workload
    %(expected = #{indent_heredoc(canonical.expected.split("\n"), 'TEXT', 0)}\n) +
      "    assert_equal expected, #{beer_song_call}"
  end

  private

  def beer_song_call
    format'BeerSong.new.%s(%s)', canonical.property, beer_song_arguments
  end

  def beer_song_arguments
    if canonical.property == 'verse'
      canonical.number
    else
      format '%s, %s', canonical.beginning, canonical.end
    end
  end
end

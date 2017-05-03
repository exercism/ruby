require 'generator/exercise_cases'

class BeerSongCase < Generator::ExerciseCase

  def workload
    %Q(expected = #{indent_heredoc(expected.split("\n"), 'TEXT', 0)}\n) +
      "    assert_equal expected, #{beer_song}"
  end

  private

  def beer_song
    "BeerSong.new.%s(%s)" % [property, beer_song_arguments]
  end

  def beer_song_arguments
    if property == 'verse'
      number
    else
      "%s, %s" % [self["beginning"], self["end"]]
    end
  end
end

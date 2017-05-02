require 'generator/exercise_cases'

class BeerSongCase < Generator::ExerciseCase

  def workload
    "assert_equal expected, #{beer_song}"
  end

  def expected
    self["expected"].gsub('\n', '"\n" \\')
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

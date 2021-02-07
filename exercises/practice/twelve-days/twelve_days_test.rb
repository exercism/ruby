require 'minitest/autorun'
require_relative 'twelve_days'

class TwelveDaysTest < Minitest::Test
  def test_the_whole_song
    song_file = File.expand_path('song.txt', __dir__)
    expected = IO.read(song_file)
    assert_equal expected, TwelveDays.song
  end
end

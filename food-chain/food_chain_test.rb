require 'minitest/autorun'

require_relative 'food_chain'

# rubocop:disable Metrics/MethodLength, Metrics/LineLength
class FoodChainTest < Minitest::Test
  def test_the_whole_song
    # Following line to accomodate automated testing
    song_file = File.expand_path('../song.txt', __FILE__)
    expected = IO.read(song_file)
    assert_equal expected, FoodChain.song
  end

  # this is some simple book-keeping to let people who are
  # giving feedback know which version of the exercise you solved.
  def test_version
    skip
    assert_equal 1, FoodChain::VERSION
  end
end

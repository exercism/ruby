#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'food_chain'

class FoodChainTest < Minitest::Test
  # This test is an acceptance test.
  #
  # If you find it difficult to work the problem with so much
  # output, go ahead and add a `skip`, and write whatever
  # unit tests will help you. Then unskip it again
  # to make sure you got it right.
  # There's no need to submit the tests you write, unless you
  # specifically want feedback on them.
  def test_the_whole_song
    song_file = File.expand_path('../song.txt', __FILE__)
    expected = IO.read(song_file)
    assert_equal expected, FoodChain.song
  end

  # This is some simple book-keeping to let people who are
  # giving feedback know which version of the exercise you solved.
  def test_version
    skip
    assert_equal 1, FoodChain::VERSION
  end
end

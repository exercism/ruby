require 'minitest/autorun'

require_relative 'food_chain'

class NoCheating < IOError
  def message
    <<~END_OF_MESSAGE
      The use of File.open and IO.read is restricted.

      This exercise intends to help you improve your ability to work
      with data generated from your code. Your program must not read
      the song.txt file.
    END_OF_MESSAGE
  end
end

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
    song_file = File.expand_path('song.txt', __dir__)
    expected  = IO.read(song_file)
    assert_equal expected, FoodChain.song
  end

  # Tests that an error is effectively raised when IO.read or
  # File.open are used within FoodChain.
  def test_read_guard
    song_file = File.expand_path('song.txt', __dir__)
    ["IO.read '#{song_file}'", "File.open '#{song_file}'"].each do |trigger|
      assert_raises(NoCheating) { FoodChain.send :class_eval, trigger }
    end
  end
end

module RestrictedClasses
  class File
    def self.open(*)
      raise NoCheating
    end

    def self.read(*)
      raise NoCheating
    end

    def open(*)
      raise NoCheating
    end

    def read(*)
      raise NoCheating
    end
  end

  class IO
    def self.read(*)
      raise NoCheating
    end

    def read(*)
      raise NoCheating
    end
  end
end

FoodChain.prepend RestrictedClasses

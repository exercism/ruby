#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'anagram'

# Common test data version: 1.0.1 196fc1a
class AnagramTest < Minitest::Test
  def test_no_matches
    # skip
    detector = Anagram.new('diaper')
    anagrams = detector.match(["hello", "world", "zombies", "pants"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_simple_anagram
    skip
    detector = Anagram.new('ant')
    anagrams = detector.match(["tan", "stand", "at"])
    expected = ["tan"]
    assert_equal expected, anagrams
  end

  def test_does_not_detect_false_positives
    skip
    detector = Anagram.new('galea')
    anagrams = detector.match(["eagle"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_two_anagrams
    skip
    detector = Anagram.new('master')
    anagrams = detector.match(["stream", "pigeon", "maters"])
    expected = ["maters", "stream"]
    assert_equal expected, anagrams.sort
  end

  def test_does_not_detect_anagram_subsets
    skip
    detector = Anagram.new('good')
    anagrams = detector.match(["dog", "goody"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_anagram
    skip
    detector = Anagram.new('listen')
    anagrams = detector.match(["enlists", "google", "inlets", "banana"])
    expected = ["inlets"]
    assert_equal expected, anagrams
  end

  def test_detects_three_anagrams
    skip
    detector = Anagram.new('allergy')
    anagrams = detector.match(["gallery", "ballerina", "regally", "clergy", "largely", "leading"])
    expected = ["gallery", "largely", "regally"]
    assert_equal expected, anagrams.sort
  end

  def test_does_not_detect_identical_words
    skip
    detector = Anagram.new('corn')
    anagrams = detector.match(["corn", "dark", "Corn", "rank", "CORN", "cron", "park"])
    expected = ["cron"]
    assert_equal expected, anagrams
  end

  def test_does_not_detect_non_anagrams_with_identical_checksum
    skip
    detector = Anagram.new('mass')
    anagrams = detector.match(["last"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_anagrams_case_insensitively
    skip
    detector = Anagram.new('Orchestra')
    anagrams = detector.match(["cashregister", "Carthorse", "radishes"])
    expected = ["Carthorse"]
    assert_equal expected, anagrams
  end

  def test_detects_anagrams_using_case_insensitive_subject
    skip
    detector = Anagram.new('Orchestra')
    anagrams = detector.match(["cashregister", "carthorse", "radishes"])
    expected = ["carthorse"]
    assert_equal expected, anagrams
  end

  def test_detects_anagrams_using_case_insensitive_possible_matches
    skip
    detector = Anagram.new('orchestra')
    anagrams = detector.match(["cashregister", "Carthorse", "radishes"])
    expected = ["Carthorse"]
    assert_equal expected, anagrams
  end

  def test_does_not_detect_a_word_as_its_own_anagram
    skip
    detector = Anagram.new('banana')
    anagrams = detector.match(["Banana"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_does_not_detect_a_anagram_if_the_original_word_is_repeated
    skip
    detector = Anagram.new('go')
    anagrams = detector.match(["go Go GO"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_anagrams_must_use_all_letters_exactly_once
    skip
    detector = Anagram.new('tapper')
    anagrams = detector.match(["patter"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_capital_word_is_not_own_anagram
    skip
    detector = Anagram.new('BANANA')
    anagrams = detector.match(["Banana"])
    expected = []
    assert_equal expected, anagrams
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 2, BookKeeping::VERSION
  end
end

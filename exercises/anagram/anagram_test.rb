#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'anagram'

# Common test data version: 196fc1a
class AnagramTest < Minitest::Test
  def test_no_matches
    # skip
    assert_equal [], Anagram.new('diaper').match(["hello", "world", "zombies", "pants"]).sort
  end

  def test_detects_simple_anagram
    skip
    assert_equal ["tan"], Anagram.new('ant').match(["tan", "stand", "at"]).sort
  end

  def test_does_not_detect_false_positives
    skip
    assert_equal [], Anagram.new('galea').match(["eagle"]).sort
  end

  def test_detects_two_anagrams
    skip
    assert_equal ["maters", "stream"], Anagram.new('master').match(["stream", "pigeon", "maters"]).sort
  end

  def test_does_not_detect_anagram_subsets
    skip
    assert_equal [], Anagram.new('good').match(["dog", "goody"]).sort
  end

  def test_detects_anagram
    skip
    assert_equal ["inlets"], Anagram.new('listen').match(["enlists", "google", "inlets", "banana"]).sort
  end

  def test_detects_three_anagrams
    skip
    assert_equal ["gallery", "largely", "regally"], Anagram.new('allergy').match(["gallery", "ballerina", "regally", "clergy", "largely", "leading"]).sort
  end

  def test_does_not_detect_identical_words
    skip
    assert_equal ["cron"], Anagram.new('corn').match(["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]).sort
  end

  def test_does_not_detect_non_anagrams_with_identical_checksum
    skip
    assert_equal [], Anagram.new('mass').match(["last"]).sort
  end

  def test_detects_anagrams_case_insensitively
    skip
    assert_equal ["Carthorse"], Anagram.new('Orchestra').match(["cashregister", "Carthorse", "radishes"]).sort
  end

  def test_detects_anagrams_using_case_insensitive_subject
    skip
    assert_equal ["carthorse"], Anagram.new('Orchestra').match(["cashregister", "carthorse", "radishes"]).sort
  end

  def test_detects_anagrams_using_case_insensitive_possible_matches
    skip
    assert_equal ["Carthorse"], Anagram.new('orchestra').match(["cashregister", "Carthorse", "radishes"]).sort
  end

  def test_does_not_detect_a_word_as_its_own_anagram
    skip
    assert_equal [], Anagram.new('banana').match(["Banana"]).sort
  end

  def test_does_not_detect_a_anagram_if_the_original_word_is_repeated
    skip
    assert_equal [], Anagram.new('go').match(["go Go GO"]).sort
  end

  def test_anagrams_must_use_all_letters_exactly_once
    skip
    assert_equal [], Anagram.new('tapper').match(["patter"]).sort
  end

  def test_capital_word_is_not_own_anagram
    skip
    assert_equal [], Anagram.new('BANANA').match(["Banana"]).sort
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
    assert_equal 3, BookKeeping::VERSION
  end
end

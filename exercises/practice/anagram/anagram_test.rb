require 'minitest/autorun'
require_relative 'anagram'

# Common test data version: 1.5.0 49a36fe
class AnagramTest < Minitest::Test
  def test_no_matches
    # skip
    detector = Anagram.new('diaper')
    anagrams = detector.match(["hello", "world", "zombies", "pants"])
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

  def test_detects_multiple_anagrams_with_different_case
    skip
    detector = Anagram.new('nose')
    anagrams = detector.match(["Eons", "ONES"])
    expected = ["Eons", "ONES"]
    assert_equal expected, anagrams.sort
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

  def test_does_not_detect_an_anagram_if_the_original_word_is_repeated
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

  def test_words_are_not_anagrams_of_themselves_case_insensitive
    skip
    detector = Anagram.new('BANANA')
    anagrams = detector.match(["BANANA", "Banana", "banana"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_words_other_than_themselves_can_be_anagrams
    skip
    detector = Anagram.new('LISTEN')
    anagrams = detector.match(["Listen", "Silent", "LISTEN"])
    expected = ["Silent"]
    assert_equal expected, anagrams
  end
end

require 'minitest/autorun'
require_relative 'anagram'

class AnagramTest < Minitest::Test
  def test_no_matches
    # skip
    detector = Anagram.new("diaper")
    anagrams = detector.match(%w[hello world zombies pants])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_two_anagrams
    skip
    detector = Anagram.new("solemn")
    anagrams = detector.match(%w[lemons cherry melons])
    expected = %w[lemons melons]
    assert_equal expected, anagrams
  end

  def test_does_not_detect_anagram_subsets
    skip
    detector = Anagram.new("good")
    anagrams = detector.match(%w[dog goody])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_anagram
    skip
    detector = Anagram.new("listen")
    anagrams = detector.match(%w[enlists google inlets banana])
    expected = ["inlets"]
    assert_equal expected, anagrams
  end

  def test_detects_three_anagrams
    skip
    detector = Anagram.new("allergy")
    anagrams = detector.match(%w[gallery ballerina regally clergy largely leading])
    expected = %w[gallery regally largely]
    assert_equal expected, anagrams
  end

  def test_detects_multiple_anagrams_with_different_case
    skip
    detector = Anagram.new("nose")
    anagrams = detector.match(%w[Eons ONES])
    expected = %w[Eons ONES]
    assert_equal expected, anagrams
  end

  def test_does_not_detect_non_anagrams_with_identical_checksum
    skip
    detector = Anagram.new("mass")
    anagrams = detector.match(["last"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_detects_anagrams_case_insensitively
    skip
    detector = Anagram.new("Orchestra")
    anagrams = detector.match(%w[cashregister Carthorse radishes])
    expected = ["Carthorse"]
    assert_equal expected, anagrams
  end

  def test_detects_anagrams_using_case_insensitive_subject
    skip
    detector = Anagram.new("Orchestra")
    anagrams = detector.match(%w[cashregister carthorse radishes])
    expected = ["carthorse"]
    assert_equal expected, anagrams
  end

  def test_detects_anagrams_using_case_insensitive_possible_matches
    skip
    detector = Anagram.new("orchestra")
    anagrams = detector.match(%w[cashregister Carthorse radishes])
    expected = ["Carthorse"]
    assert_equal expected, anagrams
  end

  def test_does_not_detect_an_anagram_if_the_original_word_is_repeated
    skip
    detector = Anagram.new("go")
    anagrams = detector.match(["go Go GO"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_anagrams_must_use_all_letters_exactly_once
    skip
    detector = Anagram.new("tapper")
    anagrams = detector.match(["patter"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_words_are_not_anagrams_of_themselves
    skip
    detector = Anagram.new("BANANA")
    anagrams = detector.match(["BANANA"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different
    skip
    detector = Anagram.new("BANANA")
    anagrams = detector.match(["Banana"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different
    skip
    detector = Anagram.new("BANANA")
    anagrams = detector.match(["banana"])
    expected = []
    assert_equal expected, anagrams
  end

  def test_words_other_than_themselves_can_be_anagrams
    skip
    detector = Anagram.new("LISTEN")
    anagrams = detector.match(%w[LISTEN Silent])
    expected = ["Silent"]
    assert_equal expected, anagrams
  end
end

require 'minitest/autorun'
require_relative 'anagram'

class AnagramTest < Minitest::Test
  def test_no_matches
    # skip
    detector = Anagram.new("diaper")
    assert_empty detector.match(%w[hello world zombies pants])
  end

  def test_detects_two_anagrams
    skip
    detector = Anagram.new("solemn")
    assert_equal %w[lemons melons], detector.match(%w[lemons cherry melons])
  end

  def test_does_not_detect_anagram_subsets
    skip
    detector = Anagram.new("good")
    assert_empty detector.match(%w[dog goody])
  end

  def test_detects_anagram
    skip
    detector = Anagram.new("listen")
    assert_equal ["inlets"], detector.match(%w[enlists google inlets banana])
  end

  def test_detects_three_anagrams
    skip
    detector = Anagram.new("allergy")
    assert_equal %w[gallery regally largely], detector.match(%w[gallery ballerina regally clergy largely leading])
  end

  def test_detects_multiple_anagrams_with_different_case
    skip
    detector = Anagram.new("nose")
    assert_equal %w[Eons ONES], detector.match(%w[Eons ONES])
  end

  def test_does_not_detect_non_anagrams_with_identical_checksum
    skip
    detector = Anagram.new("mass")
    assert_empty detector.match(["last"])
  end

  def test_detects_anagrams_case_insensitively
    skip
    detector = Anagram.new("Orchestra")
    assert_equal ["Carthorse"], detector.match(%w[cashregister Carthorse radishes])
  end

  def test_detects_anagrams_using_case_insensitive_subject
    skip
    detector = Anagram.new("Orchestra")
    assert_equal ["carthorse"], detector.match(%w[cashregister carthorse radishes])
  end

  def test_detects_anagrams_using_case_insensitive_possible_matches
    skip
    detector = Anagram.new("orchestra")
    assert_equal ["Carthorse"], detector.match(%w[cashregister Carthorse radishes])
  end

  def test_does_not_detect_an_anagram_if_the_original_word_is_repeated
    skip
    detector = Anagram.new("go")
    assert_empty detector.match(["go Go GO"])
  end

  def test_anagrams_must_use_all_letters_exactly_once
    skip
    detector = Anagram.new("tapper")
    assert_empty detector.match(["patter"])
  end

  def test_words_are_not_anagrams_of_themselves
    skip
    detector = Anagram.new("BANANA")
    assert_empty detector.match(["BANANA"])
  end

  def test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different
    skip
    detector = Anagram.new("BANANA")
    assert_empty detector.match(["Banana"])
  end

  def test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different
    skip
    detector = Anagram.new("BANANA")
    assert_empty detector.match(["banana"])
  end

  def test_words_other_than_themselves_can_be_anagrams
    skip
    detector = Anagram.new("LISTEN")
    assert_equal ["Silent"], detector.match(%w[LISTEN Silent])
  end
end

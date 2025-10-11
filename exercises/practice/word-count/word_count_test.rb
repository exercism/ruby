require 'minitest/autorun'
require_relative 'word_count'

class WordCountTest < Minitest::Test
  def test_count_one_word
    # skip
    actual = Phrase.new("word").word_count
    expected = { "word" => 1 }
    assert_equal expected, actual
  end

  def test_count_one_of_each_word
    skip
    actual = Phrase.new("one of each").word_count
    expected = { "one" => 1, "of" => 1, "each" => 1 }
    assert_equal expected, actual
  end

  def test_multiple_occurrences_of_a_word
    skip
    actual = Phrase.new("one fish two fish red fish blue fish").word_count
    expected = { "one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1 }
    assert_equal expected, actual
  end

  def test_handles_cramped_lists
    skip
    actual = Phrase.new("one,two,three").word_count
    expected = { "one" => 1, "two" => 1, "three" => 1 }
    assert_equal expected, actual
  end

  def test_handles_expanded_lists
    skip
    actual = Phrase.new("one,
two,
three").word_count
    expected = { "one" => 1, "two" => 1, "three" => 1 }
    assert_equal expected, actual
  end

  def test_ignore_punctuation
    skip
    actual = Phrase.new("car: carpet as java: javascript!!&@$%^&").word_count
    expected = { "car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1 }
    assert_equal expected, actual
  end

  def test_include_numbers
    skip
    actual = Phrase.new("testing, 1, 2 testing").word_count
    expected = { "testing" => 2, "1" => 1, "2" => 1 }
    assert_equal expected, actual
  end

  def test_normalize_case
    skip
    actual = Phrase.new("go Go GO Stop stop").word_count
    expected = { "go" => 3, "stop" => 2 }
    assert_equal expected, actual
  end

  def test_with_apostrophes
    skip
    actual = Phrase.new("'First: don't laugh. Then: don't cry. You're getting it.'").word_count
    expected = { "first" => 1, "don't" => 2, "laugh" => 1, "then" => 1, "cry" => 1, "you're" => 1, "getting" => 1, "it" => 1 }
    assert_equal expected, actual
  end

  def test_with_quotations
    skip
    actual = Phrase.new("Joe can't tell between 'large' and large.").word_count
    expected = { "joe" => 1, "can't" => 1, "tell" => 1, "between" => 1, "large" => 2, "and" => 1 }
    assert_equal expected, actual
  end

  def test_substrings_from_the_beginning
    skip
    actual = Phrase.new("Joe can't tell between app, apple and a.").word_count
    expected = { "joe" => 1, "can't" => 1, "tell" => 1, "between" => 1, "app" => 1, "apple" => 1, "and" => 1, "a" => 1 }
    assert_equal expected, actual
  end

  def test_multiple_spaces_not_detected_as_a_word
    skip
    actual = Phrase.new(" multiple   whitespaces").word_count
    expected = { "multiple" => 1, "whitespaces" => 1 }
    assert_equal expected, actual
  end

  def test_alternating_word_separators_not_detected_as_a_word
    skip
    actual = Phrase.new(",
,one,
 ,two
 'three'").word_count
    expected = { "one" => 1, "two" => 1, "three" => 1 }
    assert_equal expected, actual
  end

  def test_quotation_for_word_with_apostrophe
    skip
    actual = Phrase.new("can, can't, 'can't'").word_count
    expected = { "can" => 1, "can't" => 2 }
    assert_equal expected, actual
  end
end

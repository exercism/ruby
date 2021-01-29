require 'minitest/autorun'
require_relative 'word_count'

# Common test data version: 1.2.0 77623ec
class WordCountTest < Minitest::Test
  def test_count_one_word
    # skip
    phrase = Phrase.new("word")
    counts = {"word"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_count_one_of_each_word
    skip
    phrase = Phrase.new("one of each")
    counts = {"one"=>1, "of"=>1, "each"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_multiple_occurrences_of_a_word
    skip
    phrase = Phrase.new("one fish two fish red fish blue fish")
    counts = {"one"=>1, "fish"=>4, "two"=>1, "red"=>1, "blue"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_handles_cramped_lists
    skip
    phrase = Phrase.new("one,two,three")
    counts = {"one"=>1, "two"=>1, "three"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_handles_expanded_lists
    skip
    phrase = Phrase.new("one,\ntwo,\nthree")
    counts = {"one"=>1, "two"=>1, "three"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_ignore_punctuation
    skip
    phrase = Phrase.new("car: carpet as java: javascript!!&@$%^&")
    counts = {"car"=>1, "carpet"=>1, "as"=>1, "java"=>1, "javascript"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_include_numbers
    skip
    phrase = Phrase.new("testing, 1, 2 testing")
    counts = {"testing"=>2, "1"=>1, "2"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_normalize_case
    skip
    phrase = Phrase.new("go Go GO Stop stop")
    counts = {"go"=>3, "stop"=>2}
    assert_equal counts, phrase.word_count
  end

  def test_with_apostrophes
    skip
    phrase = Phrase.new("First: don't laugh. Then: don't cry.")
    counts = {"first"=>1, "don't"=>2, "laugh"=>1, "then"=>1, "cry"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_with_quotations
    skip
    phrase = Phrase.new("Joe can't tell between 'large' and large.")
    counts = {"joe"=>1, "can't"=>1, "tell"=>1, "between"=>1, "large"=>2, "and"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_multiple_spaces_not_detected_as_a_word
    skip
    phrase = Phrase.new(" multiple   whitespaces")
    counts = {"multiple"=>1, "whitespaces"=>1}
    assert_equal counts, phrase.word_count
  end
end

require 'minitest/autorun'
require_relative 'scrabble_score'

class ScrabbleScoreTest < Minitest::Test
  def test_lowercase_letter
    # skip
    assert_equal 1, Scrabble.score("a")
  end

  def test_uppercase_letter
    skip
    assert_equal 1, Scrabble.score("A")
  end

  def test_valuable_letter
    skip
    assert_equal 4, Scrabble.score("f")
  end

  def test_short_word
    skip
    assert_equal 2, Scrabble.score("at")
  end

  def test_short_valuable_word
    skip
    assert_equal 12, Scrabble.score("zoo")
  end

  def test_medium_word
    skip
    assert_equal 6, Scrabble.score("street")
  end

  def test_medium_valuable_word
    skip
    assert_equal 22, Scrabble.score("quirky")
  end

  def test_long_mixed_case_word
    skip
    assert_equal 41, Scrabble.score("OxyphenButazone")
  end

  def test_english_like_word
    skip
    assert_equal 8, Scrabble.score("pinata")
  end

  def test_empty_input
    skip
    assert_equal 0, Scrabble.score("")
  end

  def test_entire_alphabet_available
    skip
    assert_equal 87, Scrabble.score("abcdefghijklmnopqrstuvwxyz")
  end
end

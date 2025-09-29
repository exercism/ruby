require 'minitest/autorun'
require_relative 'scrabble_score'

class ScrabbleScoreTest < Minitest::Test
  def test_lowercase_letter
    # skip
    actual = Scrabble.new('a').score
    expected = 1
    assert_equal expected, actual
  end

  def test_uppercase_letter
    skip
    actual = Scrabble.new('A').score
    expected = 1
    assert_equal expected, actual
  end

  def test_valuable_letter
    skip
    actual = Scrabble.new('f').score
    expected = 4
    assert_equal expected, actual
  end

  def test_short_word
    skip
    actual = Scrabble.new('at').score
    expected = 2
    assert_equal expected, actual
  end

  def test_short_valuable_word
    skip
    actual = Scrabble.new('zoo').score
    expected = 12
    assert_equal expected, actual
  end

  def test_medium_word
    skip
    actual = Scrabble.new('street').score
    expected = 6
    assert_equal expected, actual
  end

  def test_medium_valuable_word
    skip
    actual = Scrabble.new('quirky').score
    expected = 22
    assert_equal expected, actual
  end

  def test_long_mixed_case_word
    skip
    actual = Scrabble.new('OxyphenButazone').score
    expected = 41
    assert_equal expected, actual
  end

  def test_english_like_word
    skip
    actual = Scrabble.new('pinata').score
    expected = 8
    assert_equal expected, actual
  end

  def test_empty_input
    skip
    actual = Scrabble.new('').score
    expected = 0
    assert_equal expected, actual
  end

  def test_entire_alphabet_available
    skip
    actual = Scrabble.new('abcdefghijklmnopqrstuvwxyz').score
    expected = 87
    assert_equal expected, actual
  end
end

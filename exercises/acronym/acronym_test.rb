require 'minitest/autorun'
require_relative 'acronym'

# Common test data version: 1.5.0 787d24e
class AcronymTest < Minitest::Test
  def test_basic
    # skip
    assert_equal "PNG", Acronym.abbreviate('Portable Network Graphics')
  end

  def test_lowercase_words
    skip
    assert_equal "ROR", Acronym.abbreviate('Ruby on Rails')
  end

  def test_punctuation
    skip
    assert_equal "FIFO", Acronym.abbreviate('First In, First Out')
  end

  def test_all_caps_word
    skip
    assert_equal "GIMP", Acronym.abbreviate('GNU Image Manipulation Program')
  end

  def test_punctuation_without_whitespace
    skip
    assert_equal "CMOS", Acronym.abbreviate('Complementary metal-oxide semiconductor')
  end

  def test_very_long_abbreviation
    skip
    assert_equal "ROTFLSHTMDCOALM", Acronym.abbreviate('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me')
  end

  def test_consecutive_delimiters
    skip
    assert_equal "SIMUFTA", Acronym.abbreviate('Something - I made up from thin air')
  end
end

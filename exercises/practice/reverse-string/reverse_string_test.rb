require 'minitest/autorun'
require_relative 'reverser'

class ReverserTest < Minitest::Test
  def test_an_empty_string
    # skip
    actual = Reverser.reverse("")
    expected = ""
    assert_equal expected, actual
  end

  def test_a_word
    skip
    actual = Reverser.reverse("robot")
    expected = "tobor"
    assert_equal expected, actual
  end

  def test_a_capitalized_word
    skip
    actual = Reverser.reverse("Ramen")
    expected = "nemaR"
    assert_equal expected, actual
  end

  def test_a_sentence_with_punctuation
    skip
    actual = Reverser.reverse("I'm hungry!")
    expected = "!yrgnuh m'I"
    assert_equal expected, actual
  end

  def test_a_palindrome
    skip
    actual = Reverser.reverse("racecar")
    expected = "racecar"
    assert_equal expected, actual
  end

  def test_an_even_sized_word
    skip
    actual = Reverser.reverse("drawer")
    expected = "reward"
    assert_equal expected, actual
  end
end

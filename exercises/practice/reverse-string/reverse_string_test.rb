require 'minitest/autorun'
require_relative 'reverser'

class ReverserTest < Minitest::Test
  def test_an_empty_string
    # skip
    assert_equal "", Reverser.reverse("")
  end

  def test_a_word
    skip
    assert_equal "tobor", Reverser.reverse("robot")
  end

  def test_a_capitalized_word
    skip
    assert_equal "nemaR", Reverser.reverse("Ramen")
  end

  def test_a_sentence_with_punctuation
    skip
    assert_equal "!yrgnuh m'I", Reverser.reverse("I'm hungry!")
  end

  def test_a_palindrome
    skip
    assert_equal "racecar", Reverser.reverse("racecar")
  end

  def test_an_even_sized_word
    skip
    assert_equal "reward", Reverser.reverse("drawer")
  end
end

require 'minitest/autorun'
require_relative 'reverse_string'

# Common test data version: 1.2.0 6c95c2e
class ReverseStringTest < Minitest::Test
  def test_an_empty_string
    # skip
    assert equal "", ReverseString.reverse("")
  end

  def test_a_word
    skip
    assert equal "tobor", ReverseString.reverse("robot")
  end

  def test_a_capitalized_word
    skip
    assert equal "nemaR", ReverseString.reverse("Ramen")
  end

  def test_a_sentence_with_punctuation
    skip
    assert equal "!yrgnuh m'I", ReverseString.reverse("I'm hungry!")
  end

  def test_a_palindrome
    skip
    assert equal "racecar", ReverseString.reverse("racecar")
  end

  def test_an_even_sized_word
    skip
    assert equal "reward", ReverseString.reverse("drawer")
  end
end

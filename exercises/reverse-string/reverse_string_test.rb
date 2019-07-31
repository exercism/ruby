require 'minitest/autorun'
require_relative 'reverse_string'

# Common test data version: 1.2.0 6c95c2e
class ReverseStringTest < Minitest::Test
  def test_an_empty_string
    # skip
    assert_equal "", ReverseString.reverse("")
  end

  def test_a_word
    skip
    assert_equal "tobor", ReverseString.reverse("robot")
  end

  def test_a_capitalized_word
    skip
    assert_equal "nemaR", ReverseString.reverse("Ramen")
  end

  def test_a_sentence_with_punctuation
    skip
    assert_equal "!yrgnuh m'I", ReverseString.reverse("I'm hungry!")
  end

  def test_a_palindrome
    skip
    assert_equal "racecar", ReverseString.reverse("racecar")
  end

  def test_an_even_sized_word
    skip
    assert_equal "reward", ReverseString.reverse("drawer")
  end
end

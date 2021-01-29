require 'minitest/autorun'
require_relative 'isogram'

# Common test data version: 1.7.0 74869e8
class IsogramTest < Minitest::Test
  def test_empty_string
    # skip
    input = ""
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_isogram_with_only_lower_case_characters
    skip
    input = "isogram"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_word_with_one_duplicated_character
    skip
    input = "eleven"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_word_with_one_duplicated_character_from_the_end_of_the_alphabet
    skip
    input = "zzyzx"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_longest_reported_english_isogram
    skip
    input = "subdermatoglyphic"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_word_with_duplicated_character_in_mixed_case
    skip
    input = "Alphabet"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_word_with_duplicated_character_in_mixed_case_lowercase_first
    skip
    input = "alphAbet"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_hypothetical_isogrammic_word_with_hyphen
    skip
    input = "thumbscrew-japingly"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_hypothetical_word_with_duplicated_character_following_hyphen
    skip
    input = "thumbscrew-jappingly"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_isogram_with_duplicated_hyphen
    skip
    input = "six-year-old"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_made_up_name_that_is_an_isogram
    skip
    input = "Emily Jung Schwartzkopf"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_duplicated_character_in_the_middle
    skip
    input = "accentor"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_same_first_and_last_characters
    skip
    input = "angola"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end
end

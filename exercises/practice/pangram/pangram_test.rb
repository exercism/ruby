require 'minitest/autorun'
require_relative 'pangram'

class PangramTest < Minitest::Test
  def test_empty_sentence
    # skip
    sentence = ""
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_perfect_lower_case
    skip
    sentence = "abcdefghijklmnopqrstuvwxyz"
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_only_lower_case
    skip
    sentence = "the quick brown fox jumps over the lazy dog"
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_missing_the_letter_x
    skip
    sentence = "a quick movement of the enemy will jeopardize five gunboats"
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_missing_the_letter_h
    skip
    sentence = "five boxing wizards jump quickly at it"
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_with_underscores
    skip
    sentence = "the_quick_brown_fox_jumps_over_the_lazy_dog"
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_with_numbers
    skip
    sentence = "the 1 quick brown fox jumps over the 2 lazy dogs"
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_missing_letters_replaced_by_numbers
    skip
    sentence = "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_mixed_case_and_punctuation
    skip
    sentence = "\"Five quacking Zephyrs jolt my wax bed.\""
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_a_m_and_a_m_are_26_different_characters_but_not_a_pangram
    skip
    sentence = "abcdefghijklm ABCDEFGHIJKLM"
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end
end

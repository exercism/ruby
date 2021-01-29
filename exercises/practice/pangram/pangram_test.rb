require 'minitest/autorun'
require_relative 'pangram'

# Common test data version: 1.4.1 2c020bc
class PangramTest < Minitest::Test
  def test_sentence_empty
    # skip
    sentence = ''
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_recognizes_a_perfect_lower_case_pangram
    skip
    sentence = 'abcdefghijklmnopqrstuvwxyz'
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_pangram_with_only_lower_case
    skip
    sentence = 'the quick brown fox jumps over the lazy dog'
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_missing_character_x
    skip
    sentence = 'a quick movement of the enemy will jeopardize five gunboats'
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_missing_character_h
    skip
    sentence = 'five boxing wizards jump quickly at it'
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_pangram_with_underscores
    skip
    sentence = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_pangram_with_numbers
    skip
    sentence = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_missing_letters_replaced_by_numbers
    skip
    sentence = '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end

  def test_pangram_with_mixed_case_and_punctuation
    skip
    sentence = '"Five quacking Zephyrs jolt my wax bed."'
    result = Pangram.pangram?(sentence)
    assert result, "Expected true, got: #{result.inspect}. #{sentence.inspect} IS a pangram"
  end

  def test_upper_and_lower_case_versions_of_the_same_character_should_not_be_counted_separately
    skip
    sentence = 'the quick brown fox jumps over with lazy FX'
    result = Pangram.pangram?(sentence)
    refute result, "Expected false, got: #{result.inspect}. #{sentence.inspect} is NOT a pangram"
  end
end

require 'minitest/autorun'
require_relative 'pangram'

# Common test data version: 1.1.0 fba1aef
class PangramTest < Minitest::Test
  def test_sentence_empty
    # skip
    phrase = ''
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_only_lower_case
    skip
    phrase = 'the quick brown fox jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_missing_character_x
    skip
    phrase = 'a quick movement of the enemy will jeopardize five gunboats'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_another_missing_character_x
    skip
    phrase = 'the quick brown fish jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_underscores
    skip
    phrase = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_pangram_with_numbers
    skip
    phrase = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_missing_letters_replaced_by_numbers
    skip
    phrase = '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_mixed_case_and_punctuation
    skip
    phrase = '"Five quacking Zephyrs jolt my wax bed."'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_upper_and_lower_case_versions_of_the_same_character_should_not_be_counted_separately
    skip
    phrase = 'the quick brown fox jumps over with lazy FX'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 5, BookKeeping::VERSION
  end
end

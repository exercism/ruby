require 'minitest/autorun'
require_relative 'alphanumeric_pattern_generator'

class AlphanumericPatternGeneratorTest < Minitest::Test
  def test_it_can_verify_a_single_alphabetic_character
    # skip
    pattern = '.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('F')
  end

  def test_it_verifies_lowercase_characters
    skip
    pattern = '.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('r')
  end

  def test_it_generates_a_single_character_pattern
    skip
    pattern = '.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_match /[A-Z]/, pg.generate
  end

  def test_it_can_verify_a_single_numeric_character
    skip
    pattern = '#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('3')
  end

  def test_it_generates_a_single_numeric_pattern
    skip
    pattern = '#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_match /[0-9]/, pg.generate
  end

  def test_it_verifies_more_complex_patterns
    skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('A3A')
  end

  def test_it_generates_more_complex_patterns
    skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_match /[A-Z][0-9][A-Z]/, pg.generate
  end

  def test_it_verifies_patterns_with_specific_elements
    skip
    pattern = '.##ZA3.#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('A23ZA3H1')
  end

  def test_it_verifies_patterns_with_specific_elements_in_different_spots
    skip
    pattern = 'A#23.9.F'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('A523B9CF')
  end

  def test_it_generates_patterns_with_constants
    skip
    pattern = 'A#23..#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_match /A[0-9]23[A-Z][A-Z][0-9]/, pg.generate
  end

  def test_it_generates_nth_value_of_patterns
    skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 'A1D', pg.generate(29)
  end

  def test_it_raises_exception_if_invalid_value_is_passed_to_generate
    skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_raises(ArgumentError) { pg.generate(10000) }
  end

  def test_it_generates_nth_value_of_patterns_with_constants
    skip
    pattern = 'R#..W'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 'R9ZEW', pg.generate(6738)
  end

  def test_it_generates_the_total_available_patterns
    skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 6760, pg.total_available
  end

  def test_it_generates_the_total_available_patterns_with_constants
    skip
    pattern = '.1.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 676, pg.total_available
  end
end

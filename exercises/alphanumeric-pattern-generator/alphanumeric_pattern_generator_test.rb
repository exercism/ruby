require 'minitest/autorun'
require_relative 'alphanumeric_pattern_generator'

class PatternGeneratorTest < Minitest::Test
  def test_it_can_verify_a_single_alphabetic_character
    pattern = '.'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('F')
    assert_equal false, pg.verify('0')
  end

  def test_it_verifies_upper_and_lowercase_characters
    pattern = '.'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('r')
    assert_equal true, pg.verify('R')
  end

  def test_it_can_verify_a_single_numeric_character
    pattern = '#'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('3')
    assert_equal false, pg.verify('W')
  end

  def test_it_verifies_more_complex_patterns
    pattern = '.#.'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('A3A')
    assert_equal true, pg.verify('a2a')
    assert_equal false, pg.verify('AAA')
  end

  def test_it_verifies_patterns_with_specific_elements
    pattern = '.##ZA3.#'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('a23za3h1')
    assert_equal true, pg.verify('a23ZA3h1')
    assert_equal false, pg.verify('a23az3h1')
  end

  def test_it_generates_nth_value_of_patterns
    pattern = '.#.'
    pg = PatternGenerator.new(pattern)

    assert_equal 'A0A', pg.generate(0)
    assert_equal 'A1B', pg.generate(27)
    assert_equal 'Z9Z', pg.generate(6759)
    assert_equal 'Z9Y', pg.generate(6758)
  end

  def test_it_raises_exception_if_invalid_valure_is_passed_to_generate
    pattern = '.#.'
    pg = PatternGenerator.new(pattern)

    assert_raises(ArgumentError) { pg.generate(10000) }
    assert_raises(ArgumentError) { pg.generate(-25) }
  end

  def test_it_generates_the_total_available_patterns
    pattern = '.#.'
    pg = PatternGenerator.new(pattern)

    assert_equal 6760, pg.total_available
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
    assert_equal 1, BookKeeping::VERSION
  end
end

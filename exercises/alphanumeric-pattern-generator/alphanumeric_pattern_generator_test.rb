require 'minitest/autorun'
require_relative 'alphanumeric_pattern_generator'

class PatternGeneratorTest < Minitest::Test
  def test_pattern_generator_verifies_patterns
    pattern = '.#.'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('A3A')
    assert_equal false, pg.verify('AAA')
    assert_equal true, pg.verify('a2a')
  end

  def test_pattern_generator_verifies_patterns_with_specific_elements
    pattern = '.##ZA3.#'
    pg = PatternGenerator.new(pattern)

    assert_equal true, pg.verify('a23za3h1')
    assert_equal true, pg.verify('a23ZA3h1')
    assert_equal false, pg.verify('a23az3h1')
  end

  def test_pattern_generator_generates_nth_value_of_patterns
    pattern = '.#.'
    pg = PatternGenerator.new(pattern)

    assert_equal 'A0A', pg.generate(0)
    assert_equal 'A1B', pg.generate(27)
    assert_equal 'Z9Z', pg.generate(6759)
    assert_equal 'Z9Y', pg.generate(6758)
    assert_equal false, pg.generate(10000)
  end

  def test_pattern_generator_generates_the_total_available_patterns
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

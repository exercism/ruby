require 'minitest/autorun'
require 'minitest/pride'
require './lib/pattern_generator'

class PatternTest < Minitest::Test
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
end

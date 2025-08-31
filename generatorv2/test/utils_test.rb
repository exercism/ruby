require_relative '../lib/generator'
require 'minitest/autorun'

class UtilTest < Minitest::Test
  def test_camelize
    assert_equal "Acronym",
      Generator.new("acronym").camel_case("acronym")
  end

  def test_camelize_with_two_words
    assert_equal "TwoFer",
      Generator.new("two-fer").camel_case("two-fer")
  end

  def test_underscore
    assert_equal "acronym",
      Generator.new("acronym").underscore("acronym")
  end

  def test_underscore_with_two_words
    assert_equal "two_fer",
      Generator.new("two-fer").underscore("two-fer")
  end

  def test_underscore_with_special_characters
    assert_equal "two_fer",
      Generator.new("two-fer").underscore("two,!@#$%^&*()-fer")
  end

  def test_underscore_with_special_characters_should_not_create_multiple_spaces
        assert_equal "two_fer",
      Generator.new("two-fer").underscore("two = fer")
  end

  def test_first_time_includes_hastag
    assert_equal "# skip",
      Generator.new("acronym").skip?
  end

  def test_skip_after_first_should_not_include_hastag
    generator = Generator.new("acronym")
    generator.skip?
    assert_equal "skip",
      generator.skip?
  end
end

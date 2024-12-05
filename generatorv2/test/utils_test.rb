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

  def test_status
    assert_equal "# skip",
      Generator.new("acronym").status
  end

  def test_status_after_first
    generator = Generator.new("acronym")
    generator.status
    assert_equal "skip",
      generator.status
  end
end

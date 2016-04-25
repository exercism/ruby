gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'bracket_push'

class BracketPushTest < Minitest::Test
  def test_empty_string
    assert Brackets.paired?('')
  end

  def test_pair_brackets
    skip
    assert Brackets.paired?('{}')
  end

  def test_unpaired
    skip
    refute Brackets.paired?('[[')
  end

  def test_wrong_ordered
    skip
    refute Brackets.paired?(')(')
  end

  def test_paired_nested
    skip
    assert Brackets.paired?('([{}({}[])])')
  end

  def test_unpaired_nested
    skip
    refute Brackets.paired?('([{])')
  end

  def test_wrong_nested
    skip
    refute Brackets.paired?('[({]})')
  end

  # Don't forget to define a constant VERSION inside of Brackets.
  def test_bookkeeping
    skip
    assert_equal 1, Brackets::VERSION
  end
end

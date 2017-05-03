#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'say'

# Common test data version: 1.0.0 be403e1
class SayTest < Minitest::Test
  def test_zero
    # skip
    question = 0
    assert_equal('zero', Say.new(question).in_english)
  end

  def test_one
    skip
    question = 1
    assert_equal('one', Say.new(question).in_english)
  end

  def test_fourteen
    skip
    question = 14
    assert_equal('fourteen', Say.new(question).in_english)
  end

  def test_twenty
    skip
    question = 20
    assert_equal('twenty', Say.new(question).in_english)
  end

  def test_twenty_two
    skip
    question = 22
    assert_equal('twenty-two', Say.new(question).in_english)
  end

  def test_one_hundred
    skip
    question = 100
    assert_equal('one hundred', Say.new(question).in_english)
  end

  def test_one_hundred_twenty_three
    skip
    question = 123
    assert_equal('one hundred twenty-three', Say.new(question).in_english)
  end

  def test_one_thousand
    skip
    question = 1_000
    assert_equal('one thousand', Say.new(question).in_english)
  end

  def test_one_thousand_two_hundred_thirty_four
    skip
    question = 1_234
    assert_equal('one thousand two hundred thirty-four', Say.new(question).in_english)
  end

  def test_one_million
    skip
    question = 1_000_000
    assert_equal('one million', Say.new(question).in_english)
  end

  def test_one_million_two_thousand_three_hundred_forty_five
    skip
    question = 1_002_345
    assert_equal('one million two thousand three hundred forty-five', Say.new(question).in_english)
  end

  def test_one_billion
    skip
    question = 1_000_000_000
    assert_equal('one billion', Say.new(question).in_english)
  end

  def test_a_big_number
    skip
    question = 987_654_321_123
    assert_equal('nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three', Say.new(question).in_english)
  end

  def test_numbers_below_zero_are_out_of_range
    skip
    question = -1
    assert_raises ArgumentError do
      Say.new(question).in_english
    end
  end

  def test_numbers_above_999999999999_are_out_of_range
    skip
    question = 1_000_000_000_000
    assert_raises ArgumentError do
      Say.new(question).in_english
    end
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
    assert_equal 1, BookKeeping::VERSION
  end
end

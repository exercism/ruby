#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'accumulate'

class ArrayTest < Minitest::Test
  def test_empty_accumulation
    assert_equal [], [].accumulate { |e| e * e }
  end

  def test_accumulate_squares
    skip
    result = [1, 2, 3].accumulate do |number|
      number * number
    end
    assert_equal [1, 4, 9], result
  end

  def test_accumulate_upcases
    skip
    result = %w(hello world).accumulate(&:upcase)
    assert_equal %w(HELLO WORLD), result
  end

  def test_accumulate_reversed_strings
    skip
    result = %w(the quick brown fox etc).accumulate(&:reverse)
    assert_equal %w(eht kciuq nworb xof cte), result
  end

  def test_accumulate_recursively
    skip
    result = %w(a b c).accumulate do |char|
      %w(1 2 3).accumulate do |digit|
        "#{char}#{digit}"
      end
    end
    assert_equal [%w(a1 a2 a3), %w(b1 b2 b3), %w(c1 c2 c3)], result
  end

  def test_do_not_change_in_place
    skip
    original = [1, 2, 3]
    copy = original.dup
    original.accumulate { |n| n * n }
    assert_equal copy, original
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module.
  #  In your file, it will look like this:
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

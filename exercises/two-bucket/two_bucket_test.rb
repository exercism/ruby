#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'two_bucket'

# Common test data version: 7aa0b42
class TwoBucketTest < Minitest::Test
  def test_bucket_one_size_3_bucket_two_size_5_goal_1_start_with_bucket_one
    # skip
    two_bucket = TwoBucket.new(3, 5, 1, 'one')
    assert_equal 4, two_bucket.moves
    assert_equal 'one', two_bucket.goal_bucket
    assert_equal 5, two_bucket.other_bucket
  end

  def test_bucket_one_size_3_bucket_two_size_5_goal_1_start_with_bucket_two
    skip
    two_bucket = TwoBucket.new(3, 5, 1, 'two')
    assert_equal 8, two_bucket.moves
    assert_equal 'two', two_bucket.goal_bucket
    assert_equal 3, two_bucket.other_bucket
  end

  def test_bucket_one_size_7_bucket_two_size_11_goal_2_start_with_bucket_one
    skip
    two_bucket = TwoBucket.new(7, 11, 2, 'one')
    assert_equal 14, two_bucket.moves
    assert_equal 'one', two_bucket.goal_bucket
    assert_equal 11, two_bucket.other_bucket
  end

  def test_bucket_one_size_7_bucket_two_size_11_goal_2_start_with_bucket_two
    skip
    two_bucket = TwoBucket.new(7, 11, 2, 'two')
    assert_equal 18, two_bucket.moves
    assert_equal 'two', two_bucket.goal_bucket
    assert_equal 7, two_bucket.other_bucket
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
    assert_equal 2, BookKeeping::VERSION
  end
end

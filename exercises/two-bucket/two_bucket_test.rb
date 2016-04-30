#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'two_bucket'

# Test data version:
# 4626617 Merge pull request #237 from moofkit/bracket_push_tests

class TwoBucketTest < Minitest::Test
  def test_bucket_one_3_bucket_two_5_goal_1_starting_one
    two_bucket = TwoBucket.new(3, 5, 1, 'one')
    assert_equal 4, two_bucket.moves
    assert_equal 'one', two_bucket.goal_bucket
    assert_equal 5, two_bucket.other_bucket
  end

  def test_bucket_one_3_bucket_two_5_goal_1_starting_two
    skip
    two_bucket = TwoBucket.new(3, 5, 1, 'two')
    assert_equal 8, two_bucket.moves
    assert_equal 'two', two_bucket.goal_bucket
    assert_equal 3, two_bucket.other_bucket
  end

  def test_bucket_one_7_bucket_two_11_goal_2_starting_one
    skip
    two_bucket = TwoBucket.new(7, 11, 2, 'one')
    assert_equal 14, two_bucket.moves
    assert_equal 'one', two_bucket.goal_bucket
    assert_equal 11, two_bucket.other_bucket
  end

  def test_bucket_one_7_bucket_two_11_goal_2_starting_two
    skip
    two_bucket = TwoBucket.new(7, 11, 2, 'two')
    assert_equal 18, two_bucket.moves
    assert_equal 'two', two_bucket.goal_bucket
    assert_equal 7, two_bucket.other_bucket
  end

  # Don't forget to define a constant VERSION inside of TwoBucket
  def test_bookkeeping
    skip
    assert_equal 1, TwoBucket::VERSION
  end
end

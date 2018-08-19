require 'minitest/autorun'
require_relative 'two_bucket'

# Common test data version: 1.2.0 8aa11e8
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

  def test_bucket_one_size_1_bucket_two_size_3_goal_3_start_with_bucket_two
    skip
    two_bucket = TwoBucket.new(1, 3, 3, 'two')
    assert_equal 1, two_bucket.moves
    assert_equal 'two', two_bucket.goal_bucket
    assert_equal 0, two_bucket.other_bucket
  end

  def test_bucket_one_size_2_bucket_two_size_3_goal_3_start_with_bucket_one
    skip
    two_bucket = TwoBucket.new(2, 3, 3, 'one')
    assert_equal 2, two_bucket.moves
    assert_equal 'two', two_bucket.goal_bucket
    assert_equal 2, two_bucket.other_bucket
  end
end

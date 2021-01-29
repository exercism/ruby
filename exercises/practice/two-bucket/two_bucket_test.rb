require 'minitest/autorun'
require_relative 'two_bucket'

# Common test data version: 1.4.0 edbc86b
class TwoBucketTest < Minitest::Test
  def test_bucket_one_size_3_bucket_two_size_5_goal_1_start_with_bucket_one
    # skip
    subject = TwoBucket.new(3, 5, 1, 'one')
    assert_equal 4, subject.moves
    assert_equal 'one', subject.goal_bucket
    assert_equal 5, subject.other_bucket
  end

  def test_bucket_one_size_3_bucket_two_size_5_goal_1_start_with_bucket_two
    skip
    subject = TwoBucket.new(3, 5, 1, 'two')
    assert_equal 8, subject.moves
    assert_equal 'two', subject.goal_bucket
    assert_equal 3, subject.other_bucket
  end

  def test_bucket_one_size_7_bucket_two_size_11_goal_2_start_with_bucket_one
    skip
    subject = TwoBucket.new(7, 11, 2, 'one')
    assert_equal 14, subject.moves
    assert_equal 'one', subject.goal_bucket
    assert_equal 11, subject.other_bucket
  end

  def test_bucket_one_size_7_bucket_two_size_11_goal_2_start_with_bucket_two
    skip
    subject = TwoBucket.new(7, 11, 2, 'two')
    assert_equal 18, subject.moves
    assert_equal 'two', subject.goal_bucket
    assert_equal 7, subject.other_bucket
  end

  def test_bucket_one_size_1_bucket_two_size_3_goal_3_start_with_bucket_two
    skip
    subject = TwoBucket.new(1, 3, 3, 'two')
    assert_equal 1, subject.moves
    assert_equal 'two', subject.goal_bucket
    assert_equal 0, subject.other_bucket
  end

  def test_bucket_one_size_2_bucket_two_size_3_goal_3_start_with_bucket_one
    skip
    subject = TwoBucket.new(2, 3, 3, 'one')
    assert_equal 2, subject.moves
    assert_equal 'two', subject.goal_bucket
    assert_equal 2, subject.other_bucket
  end
end

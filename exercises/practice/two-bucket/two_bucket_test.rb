require 'minitest/autorun'
require_relative 'two_bucket'

class TwoBucketTest < Minitest::Test
  def test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_one
    # skip
    subject = TwoBucket.new(3, 5, 1, "one")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [4, "one", 5]
    assert_equal expected, actual
  end

  def test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_two
    skip
    subject = TwoBucket.new(3, 5, 1, "two")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [8, "two", 3]
    assert_equal expected, actual
  end

  def test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_one
    skip
    subject = TwoBucket.new(7, 11, 2, "one")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [14, "one", 11]
    assert_equal expected, actual
  end

  def test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_two
    skip
    subject = TwoBucket.new(7, 11, 2, "two")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [18, "two", 7]
    assert_equal expected, actual
  end

  def test_measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3___start_with_bucket_two
    skip
    subject = TwoBucket.new(1, 3, 3, "two")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [1, "two", 0]
    assert_equal expected, actual
  end

  def test_measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3___start_with_bucket_one_and_end_with_bucket_two
    skip
    subject = TwoBucket.new(2, 3, 3, "one")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [2, "two", 2]
    assert_equal expected, actual
  end

  def test_measure_using_bucket_one_much_bigger_than_bucket_two
    skip
    subject = TwoBucket.new(5, 1, 2, "one")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [6, "one", 1]
    assert_equal expected, actual
  end

  def test_measure_using_bucket_one_much_smaller_than_bucket_two
    skip
    subject = TwoBucket.new(3, 15, 9, "one")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [6, "two", 0]
    assert_equal expected, actual
  end

  def test_with_the_same_buckets_but_a_different_goal_then_it_is_possible
    skip
    subject = TwoBucket.new(6, 15, 9, "one")
    actual = [subject.moves, subject.goal_bucket, subject.other_bucket]
    expected = [10, "two", 0]
    assert_equal expected, actual
  end
end

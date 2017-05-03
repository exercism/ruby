require 'generator/exercise_case'

class TwoBucketCase < Generator::ExerciseCase
  def name
    "test_bucket_one_size_#{bucket_one}_bucket_two_"\
    "size_#{bucket_two}_goal_#{goal}_start_with_bucket_#{start_bucket}"
  end

  def workload
    "two_bucket = #{self.do}
    assert_equal #{expected['moves']}, two_bucket.moves
    assert_equal '#{expected['goal_bucket']}', two_bucket.goal_bucket
    assert_equal #{expected['other_bucket']}, two_bucket.other_bucket"
  end

  def do
    "TwoBucket.new(#{bucket_one}, #{bucket_two}, #{goal}, '#{start_bucket}')"
  end

end

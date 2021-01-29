require 'generator/exercise_case'

class TwoBucketCase < Generator::ExerciseCase
  def description
    "bucket one size #{bucket_one} bucket two size #{bucket_two} "+
      "goal #{goal} start with bucket #{start_bucket}"
  end

  def workload
    [
      "subject = TwoBucket.new(#{bucket_one}, #{bucket_two}, #{goal}, '#{start_bucket}')",
      "assert_equal #{moves}, subject.moves",
      "assert_equal '#{goal_bucket}', subject.goal_bucket",
      "assert_equal #{other_bucket}, subject.other_bucket",
    ]
  end
end

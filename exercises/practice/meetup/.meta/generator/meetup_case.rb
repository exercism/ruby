require 'generator/exercise_case'

class MeetupCase < Generator::ExerciseCase
  def workload
    [
      "meetup = Meetup.new(#{month}, #{year}).day(:#{dayofweek.downcase}, :#{week})",
      "assert_equal Date.parse(#{expected.inspect}), meetup"
    ]
  end
end

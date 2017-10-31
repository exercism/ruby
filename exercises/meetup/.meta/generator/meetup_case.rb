require 'generator/exercise_case'

class MeetupCase < Generator::ExerciseCase

  def workload
    indent_lines(["assert_equal Date.new(#{year}, #{month}, #{dayofmonth}),",
      "  Meetup.new(#{month}, #{year}).day(:#{dayofweek.downcase}, :#{week})"
    ], 4)
  end

end

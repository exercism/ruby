require 'generator/exercise_case'
require 'date'

class MeetupCase < Generator::ExerciseCase

  def workload
    indent_lines([
      "assert_equal Date.new(#{year}, #{month}, #{dayofmonth}),",
      "  Meetup.new(\"#{week.to_s.capitalize} #{dayofweek.to_s.capitalize} of #{Date::MONTHNAMES[month]}, #{year}\").to_date"
    ], 4)
  end

end

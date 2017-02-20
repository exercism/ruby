require 'generator/exercise_case'

class SpaceAgeCase < Generator::ExerciseCase
  using Generator::Underscore

  def workload
    indent_lines(["age = SpaceAge.new(#{seconds.underscore})",
      "assert_in_delta #{expected}, age.on_#{planet.downcase}, DELTA"
    ], 4)
  end
end

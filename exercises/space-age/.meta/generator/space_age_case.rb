require 'generator/exercise_case'

class SpaceAgeCase < Generator::ExerciseCase

  def workload
    indent_lines(["age = SpaceAge.new(#{literal(seconds)})",
      "assert_in_delta #{expected}, age.on_#{planet.downcase}, DELTA"
    ], 4)
  end
end

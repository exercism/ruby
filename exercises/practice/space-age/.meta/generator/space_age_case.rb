require 'generator/exercise_case'

class SpaceAgeCase < Generator::ExerciseCase
  def workload
    [
      "age = SpaceAge.new(#{underscore(seconds)})\n",
      "assert_in_delta #{expected}, age.on_#{planet.downcase}, DELTA\n"
    ].join
  end
end

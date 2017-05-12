require 'generator/exercise_case'

class PigLatinCase < Generator::ExerciseCase
  def workload
    assert_equal { "PigLatin.translate(#{input.inspect})" }
  end
end

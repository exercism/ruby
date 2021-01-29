require 'generator/exercise_case'

class PigLatinCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, "PigLatin.translate(#{phrase.inspect})")
  end
end

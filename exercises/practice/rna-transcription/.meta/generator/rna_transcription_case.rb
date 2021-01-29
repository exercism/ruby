require 'generator/exercise_case'

class RnaTranscriptionCase < Generator::ExerciseCase
  def workload
    "assert_equal '#{expected}', Complement.of_dna('#{dna}')"
  end
end

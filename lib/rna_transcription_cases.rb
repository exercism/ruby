require 'exercise_cases'

class RnaTranscriptionCase < ExerciseCase

  def workload
    "assert_equal '#{expected}', Complement.of_dna('#{dna}')"
  end

end

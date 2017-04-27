class PigLatinCase < ExerciseCase
  def workload
    assert_equal { "PigLatin.translate(#{input.inspect})" }
  end
end

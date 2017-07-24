require 'generator/exercise_case'

class RotationalCipherCase < Generator::ExerciseCase

  def workload
    assert_equal { "RotationalCipher.rotate(\"#{text.to_s}\", #{shiftKey.to_s})" }
  end

end

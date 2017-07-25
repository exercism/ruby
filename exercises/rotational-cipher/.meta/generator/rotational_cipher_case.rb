require 'generator/exercise_case'

class RotationalCipherCase < Generator::ExerciseCase

  def workload
    assert_equal { %Q[RotationalCipher.rotate("#{text}", #{shiftKey})] }
  end

end

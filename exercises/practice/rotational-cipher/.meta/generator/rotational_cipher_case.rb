require 'generator/exercise_case'

class RotationalCipherCase < Generator::ExerciseCase
  def workload
    assert_equal expected, "RotationalCipher.rotate(#{text.inspect}, #{shift_key})"
  end
end

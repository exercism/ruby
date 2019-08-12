require 'generator/exercise_case'

class AtbashCipherCase < Generator::ExerciseCase
  def workload
    case property
    when 'encode' then encode_workload
    when 'decode' then decode_workload
    else raise 'unexpected property encountered'
    end
  end

  def encode_workload
    [
      "plaintext = '#{phrase}'",
      "ciphertext = '#{expected}'",
      "assert_equal ciphertext, Atbash.encode(plaintext)"
    ]
  end

  def decode_workload
    [
      "ciphertext = '#{phrase}'",
      "plaintext = '#{expected}'",
      "assert_equal plaintext, Atbash.decode(ciphertext)"
    ]
  end
end

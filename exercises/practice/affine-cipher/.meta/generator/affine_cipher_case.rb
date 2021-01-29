require 'generator/exercise_case'

class AffineCipherCase < Generator::ExerciseCase

  def workload
    return error_workload if error_expected?
    case property
    when 'encode' then encode_workload
    when 'decode' then decode_workload
    else raise 'unexpected property encountered'
    end
  end

  private

  def encode_workload
    [
      "cipher = #{new_cipher}\n",
      "plaintext = '#{phrase}'\n",
      "ciphertext = '#{expected}'\n",
      "assert_equal ciphertext, cipher.encode(plaintext)\n"
    ].join
  end

  def decode_workload
    [
      "cipher = #{new_cipher}\n",
      "ciphertext = '#{phrase}'\n",
      "plaintext = '#{expected}'\n",
      "assert_equal plaintext, cipher.decode(ciphertext)\n"
    ].join
  end

  def error_workload
     "assert_raises(ArgumentError) { #{new_cipher} }\n"
  end

  def new_cipher
    "Affine.new(#{key['a']}, #{key['b']})"
  end
end

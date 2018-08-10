require 'generator/exercise_case'

class AffineCipherCase < Generator::ExerciseCase

  def workload
    if expected.start_with?("Error:")
      error_workload
    elsif property == "encode"
      encode_workload
    elsif property == "decode"
      decode_workload
    end
  end

  private

  def encode_workload
    a, b = input['key']['a'], input['key']['b']
    indent_lines(
      [
        "cipher = Affine.new",
        "cipher.addkey(#{a}, #{b})",
        "plaintext = '#{input['phrase']}'",
        "ciphertext = '#{expected}'",
        "assert_equal ciphertext, cipher.encode(plaintext)"
      ], 4
    )
  end

  def decode_workload
    a, b = input['key']['a'], input['key']['b']
    indent_lines(
      [
        "cipher = Affine.new",
        "cipher.addkey(#{a}, #{b})",
        "plaintext = '#{expected}'",
        "ciphertext = '#{input['phrase']}'",
        "assert_equal plaintext, cipher.decode(ciphertext)"
      ], 4
    )
  end

  def error_workload
    a, b = input['key']['a'], input['key']['b']
    indent_lines(
      [
        "cipher = Affine.new",
        "assert_raises(ArgumentError) { cipher.addkey(#{a}, #{b}) }"
      ], 4
    )
  end
end

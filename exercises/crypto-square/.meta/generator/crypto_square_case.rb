require 'generator/exercise_case'

class CryptoSquareCase < Generator::ExerciseCase

  def workload
    indent_lines([plaintext_setter, assertion], 4)
  end

  private

  def plaintext_setter
    "plaintext = '#{plaintext}'"
  end

  def assertion
    assert_equal { "Crypto.new(plaintext).ciphertext" }
  end

end

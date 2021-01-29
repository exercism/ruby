require 'generator/exercise_case'

class CryptoSquareCase < Generator::ExerciseCase
  def workload
    [
      "plaintext = '#{plaintext}'\n",
      assert_equal(expected, "Crypto.new(plaintext).ciphertext")
    ].join
  end
end

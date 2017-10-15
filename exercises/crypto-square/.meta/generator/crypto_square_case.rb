require 'generator/exercise_case'

class CryptoSquareCase < Generator::ExerciseCase

  # TODO: remove guard clause when #encoded method
  # is added to crypto_square.rb
  def workload
    return if property == 'encoded'
    fix_canoncical_expected_value
    indent_lines(["crypto = Crypto.new('#{plaintext}')",
                  "assert_equal #{expected}, #{actual}"
    ], 4)
  end

  private

  def actual
    case property
    when 'normalizedPlaintext'
      'crypto.normalize_plaintext'
    when 'plaintextSegments'
      'crypto.plaintext_segments'
    when 'ciphertext'
      ciphertext_method_call
    end
  end

  def expected
    canonical.expected.inspect
  end

  def ciphertext_method_call
    if canonical.expected.include?(' ')
      'crypto.normalize_ciphertext'
    else
      'crypto.ciphertext'
    end
  end

  # TODO: remove when canonical data is fixed
  def fix_canoncical_expected_value
    return unless canonical.expected.include?('  ')
    canonical.expected = canonical.expected.gsub(/\s\s/, ' ').chomp(' ')
  end

end

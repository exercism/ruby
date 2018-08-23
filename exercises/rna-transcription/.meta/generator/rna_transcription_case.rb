require 'generator/exercise_case'

class RnaTranscriptionCase < Generator::ExerciseCase
  def workload
    if expects_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    "assert_equal '#{expected}', Complement.of_dna('#{dna}')"
  end

  def expects_error?
    expected.is_a? Hash
  end
end

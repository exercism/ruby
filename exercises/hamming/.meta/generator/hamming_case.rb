require 'generator/exercise_case'

class HammingCase < Generator::ExerciseCase
  def workload
    if expects_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    "Hamming.compute('#{strand1}', '#{strand2}')"
  end

  def expects_error?
    expected.is_a? Hash
  end
end

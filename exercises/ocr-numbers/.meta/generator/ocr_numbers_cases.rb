require 'generator/exercise_cases'

class OcrNumbersCase < Generator::ExerciseCase
  def workload
    if raises_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    %Q(OcrNumbers.convert(#{(input.join("\n")).inspect}))
  end
end

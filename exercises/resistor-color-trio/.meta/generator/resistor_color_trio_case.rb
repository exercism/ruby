require 'generator/exercise_case'

class ResistorColorTrioCase < Generator::ExerciseCase
  def workload
    if error_expected?
      assert_raises(ArgumentError, subject_of_test)
    else
      assert_equal(expected, subject_of_test)
    end
  end

  private

  def subject_of_test
    "ResistorColorTrio.new(#{colors}).label"
  end

  def expected
    "Resistor value: #{super['value']} #{super['unit']}"
  end
end

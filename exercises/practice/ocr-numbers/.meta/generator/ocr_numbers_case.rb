require 'generator/exercise_case'

class OcrNumbersCase < Generator::ExerciseCase
  def workload
    [
      formatted_rows,
      if error_expected?
        assert_raises(ArgumentError, subject_of_test)
      else
        assert_equal(expected, subject_of_test)
      end
    ]
  end

  def description
    super.gsub(/\?/,'question_mark')
  end

  private

  def formatted_rows
    [
      "input = [",
      indent_by(9, rows.map(&:inspect).join(",\n")).sub(/^ */,''),
      %Q{].join("\\n")\n}
    ].join
  end

  def subject_of_test
    "OcrNumbers.convert(input)"
  end
end

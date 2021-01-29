require 'generator/exercise_case'

class AllYourBaseCase < Generator::ExerciseCase
  def workload
    assignments + assertion
  end

  private

  def assignments
    [
      "digits = #{input_digits}",
      "input_base = #{input_base}",
      "output_base = #{output_base}"
    ]
  end

  def assertion
    if error_expected?
      [error_assertion]
    else
      standard_assertion
    end
  end

  def standard_assertion
    [
      "expected = #{expected}",
      '',
      'converted = BaseConverter.convert(input_base, digits, output_base)',
      '',
      "hint = #{hint}",
      '',
      'assert_equal expected, converted, hint',
    ]
  end

  def hint
    [
      "\"Input base: #{input_base}, output base #{output_base}. \" +\n",
      indent_by(7, %q("Expected #{expected} but got #{converted}.") + "\n")
    ].join
  end

  def error_assertion
    assert_raises(ArgumentError, 'BaseConverter.convert(input_base, digits, output_base)')
  end
end

require 'generator/exercise_case'

class ComplexNumbersCase < Generator::ExerciseCase
  MATH_SYMBOLS = {
    'e' => 'Math::E',
    'pi' => 'Math::PI',
    'ln(2)' => 'Math.log(2)'
  }.freeze

  def description
    super.gsub(/'/,'')
  end

  def workload
    [
      "expected = #{expected_value}\n",
      "assert_equal expected, #{subject}#{operation}\n"
    ].join
  end

  def expected_value
    if expected.is_a? Array
      complex_number(*expected)
    else
      expected
    end
  end

  def subject
    complex_number(*(input['z'] || z1))
  end

  def complex_number(real, imaginary)
    real, imaginary = [real, imaginary].map { |el| MATH_SYMBOLS[el] || el }
    "ComplexNumber.new(#{real}, #{imaginary})"
  end

  def operation
    case property
    when 'add' then " + #{complex_number(*z2)}"
    when 'sub' then " - #{complex_number(*z2)}"
    when 'mul' then " * #{complex_number(*z2)}"
    when 'div' then " / #{complex_number(*z2)}"
    else ".#{property}"
    end
  end
end

require 'generator/exercise_case'

class ComplexNumbersCase < Generator::ExerciseCase

  def workload
    indent_text(4, testcase)
  end

  def number
    (respond_to? :input) ? input : z1
  end

  def operation
    case property
    when "add" then " + #{construct_complex(z2)}"
    when "sub" then " - #{construct_complex(z2)}" 
    when "mul" then " * #{construct_complex(z2)}" 
    when "div" then " / #{construct_complex(z2)}" 
    else ".#{property}"
    end
  end

  def testcase
    "expected = #{expected_value}\n" +
    "assert_equal expected, #{construct_complex(number)}#{operation}"
  end

  def construct_complex(value)
    "ComplexNumber.new(#{parse_number(value)})"
  end

  def expected_value
    (expected.is_a? Numeric) ? expected : construct_complex(expected)
  end

  def parse_number(number)
    return number if number.is_a? Numeric
    Array(number).map do |elem|
      (elem.is_a? Numeric) ? elem.to_s : "Math::#{elem.upcase}"
    end.join(", ")
  end

end


require 'generator/exercise_case'

class ComplexNumbersCase < Generator::ExerciseCase

  def workload
    indent_text(4, testcase)
  end

  def number
    parse_number((respond_to? :input) ? input : z1)
  end

  def operation
    case property
    when "add" then " + ComplexNumber.new(#{z2})"
    when "sub" then " - ComplexNumber.new(#{z2})"
    when "mul" then " * ComplexNumber.new(#{z2})"
    when "div" then " / ComplexNumber.new(#{z2})"
    else ".#{property}"
    end
  end

  def testcase
    "expected = ComplexNumber.new(#{parse_number(expected)})\n" +
    "assert_equal expected, ComplexNumber.new(#{number})#{operation}"
  end

  def parse_number(number)
   "["+ Array(number).map do |elem|
#      (elem.is_a? Numeric) ? elem : Math.const_get(elem.upcase.to_sym)
      (elem.is_a? Numeric) ? elem.to_s : "Math::#{elem.upcase}"
    end.join(", ") + "]"
  end

end


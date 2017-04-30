require 'generator/exercise_cases'

class EtlCase < ExerciseCase
  def workload
    indent_lines([
      "old = {\n      #{format(input)}\n    }",
      "expected = {\n      #{format(expected)}\n    }",
      "assert_equal expected, ETL.transform(old)"
    ], 4)
  end

  private

  def format(obj)
    case
    when obj.respond_to?(:each_pair)
      indent_lines(
        obj.each_with_object([]) {|(k, v), string| string << "#{format(k)} => #{format(v)}" },
        6,
        ",\n"
      )
    when obj.respond_to?(:each) then obj
    when obj.to_s =~ /\d+/ then obj.to_i
    else %Q('#{obj}')
    end
  end

end

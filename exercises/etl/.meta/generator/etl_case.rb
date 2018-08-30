require 'generator/exercise_case'

class EtlCase < Generator::ExerciseCase
  def workload
    [
      "old = {\n#{indent_by(2, format(input))}\n}\n",
      "expected = {\n#{indent_by(2,format(expected))}\n}\n",
      "assert_equal expected, ETL.transform(old)\n"
    ].join
  end

  private

  def format(obj)
    case obj
    when Hash
     obj.reduce([]) {|lines, (k, v)| lines << "#{format(k)} => #{format(v)}" }.join(",\n")
    when String
      obj =~ /\d+/ ? obj.to_i : "'#{obj}'"
    else
      obj
    end
  end
end

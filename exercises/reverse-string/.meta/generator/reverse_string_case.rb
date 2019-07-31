require 'generator/exercise_case'

class ReverseStringCase < Generator::ExerciseCase
  def workload
    [
      "assert equal #{expected.inspect}, ReverseString.reverse(#{value.inspect})"
    ]
  end
end

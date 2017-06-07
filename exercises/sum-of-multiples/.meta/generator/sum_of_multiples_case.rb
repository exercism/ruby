require 'generator/exercise_case'

class SumOfMultiplesCase < Generator::ExerciseCase
  using Generator::Underscore

  def workload
    assert_expected = "assert_equal #{expected.underscore}"
    value = "SumOfMultiples.new(#{factors.join(', ')}).to(#{limit})"
    indent_lines(["#{assert_expected}, #{value}"], 4)
  end
end

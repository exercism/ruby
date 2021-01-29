require 'generator/exercise_case'

class SumOfMultiplesCase < Generator::ExerciseCase
  def workload
    [
      "sum_of_multiples = SumOfMultiples.new(#{factors.join(', ')})\n",
      "assert_equal #{underscore(expected)}, sum_of_multiples.to(#{underscore(limit)})\n"
    ].join
  end
end

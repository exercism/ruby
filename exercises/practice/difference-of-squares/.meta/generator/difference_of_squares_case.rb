require 'generator/exercise_case'

class DifferenceOfSquaresCase < Generator::ExerciseCase

  def workload
    "assert_equal #{underscore(expected)}, Squares.new(#{number}).#{action}\n"
  end

  def action
    case property
    when 'differenceOfSquares' then 'difference'
    else snake_case(property)
    end
  end
end

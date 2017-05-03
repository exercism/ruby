require 'generator/exercise_case'

class DifferenceOfSquaresCase < Generator::ExerciseCase

  def workload
    %Q(assert_equal #{expected_formatted}, Squares.new(#{number}).#{action})
  end

  def action
    return 'difference' if property == 'differenceOfSquares'
    property.gsub(/([OS])/) {|cap| "_#{$1.downcase}" }
  end

  def expected_formatted
    expected.to_s.reverse.scan(/\d{1,3}/).join('_').reverse
  end
end

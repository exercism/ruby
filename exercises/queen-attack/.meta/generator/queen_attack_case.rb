require 'generator/exercise_case'

class QueenAttackCase < Generator::ExerciseCase

  def workload
    send("#{snake_case(property)}_assertion")
  end

  private

  def can_attack_assertion
    [
      "queens = Queens.new(white: #{parse_position white_queen}, black: #{parse_position black_queen})",
      assert_or_refute(expected, "queens.attack?")
    ]
  end

  def create_assertion
    if error_expected?
      assert_raises(ArgumentError, new_queen)
    else
      assert_or_refute(expected, new_queen)
    end
  end

  def parse_position(queen)
    [queen['position']['row'], queen['position']['column']]
  end

  def new_queen
    "Queens.new(white: #{parse_position queen})"
  end
end

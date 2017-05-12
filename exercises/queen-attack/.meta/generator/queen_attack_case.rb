require 'generator/exercise_case'

class QueenAttackCase < Generator::ExerciseCase

  def workload
    property == 'create' ? create_workload : attack_workload
  end

  private

  def attack_workload
    """queens = Queens.new(white: #{parse_position white_queen}, black: #{parse_position black_queen})
    #{assert} queens.attack?"""
  end

  def parse_position queen
    queen['position'].delete('() ').split(',').map{|i| i.to_i}
  end

  def create_workload
    raises_error? ? exception : "#{assert} #{test_case}"
  end

  def test_case
    "Queens.new(white: #{parse_position queen})"
  end

  def exception
    """assert_raises ArgumentError do
      #{test_case}
    end"""
  end
end

require 'generator/exercise_case'

class HighScoresCase < Generator::ExerciseCase
  def workload
    [
      "scores = #{scores}",
      assertions
    ].flatten
  end

  private

  def assertions
    case property
    when 'latestIsPersonalBest' then boolean_assertion
    else regular_assertion
    end
  end

  def regular_assertion
    [
      "expected = #{expected.inspect}",
      "assert_equal expected, HighScores.new(scores).#{snake_case(property)}"
    ]
  end

  def boolean_assertion
    assert_or_refute(expected, "HighScores.new(scores).#{snake_case(property)}?")
  end
end

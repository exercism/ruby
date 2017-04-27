require 'generator/exercise_cases'

class BowlingCase < ExerciseCase

  def workload
    indent_lines(assert)
  end

  private

  def roll_previous
    "record(#{previous_rolls})"
  end

  def assert
    if assert_error?
      property == 'score' ? score_raises : roll_raises
    else
      [roll_previous, "assert_equal #{expected}, @game.score"]
    end
  end

  def roll_raises
    [
      roll_previous,
      'assert_raises Game::BowlingError do',
      '  @game.roll(' + roll.to_s + ')',
      'end'
    ]
  end

  def score_raises
    [
      roll_previous,
      'assert_raises Game::BowlingError do',
      '  @game.score',
      'end'
    ]
  end

  def assert_error?
    expected.respond_to?(:key?) && expected.key?('error')
  end

  def indent_lines(code)
    code.join("\n" + ' ' * 4)
  end
end

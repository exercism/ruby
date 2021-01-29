require 'generator/exercise_case'

class BowlingCase < Generator::ExerciseCase

  def workload
    [
      roll_previous,
      assert
    ].join
  end

  private

  def roll_previous
    [
    "game = Game.new\n",
    "rolls = #{previous_rolls}\n",
    "rolls.each { |pins| game.roll(pins) }\n"
    ]
  end

  def assert
    return error_assertion if error_expected?
    standard_assertion
  end

  def standard_assertion
    ["assert_equal #{expected}, game.score\n"]
  end

  def error_assertion
    body = case property
           when 'score' then "game.score\n"
           when 'roll'  then "game.roll(#{roll})\n"
           end

    assert_raises("Game::BowlingError", body)
  end

  def assert_raises(error, body)
    [
      "assert_raises #{error} do\n",
        indent_by(2, body),
      "end\n"
    ]
  end
end

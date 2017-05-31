require 'generator/exercise_case'

class ConnectCase < Generator::ExerciseCase

  def test_body
    [
      'board = [',
      '  ' + board.map(&method(:single_quote)).join(",\n      "),
      ']',
      'game = Board.new(board)',
      "assert_equal #{single_quote(expected)}, game.winner, " +
        single_quote(description)
    ]
  end

  private

  def single_quote(string)
    string.inspect.tr('"', "'")
  end

end

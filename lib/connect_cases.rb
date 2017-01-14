require 'exercise_cases'

class ConnectCase < OpenStruct
  def name
    'test_%s' % description
                .gsub(/[() -]/, '_')
                .chomp('_')
                .downcase
  end

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

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def single_quote(string)
    string.inspect.tr('"', "'")
  end

  def ignore_method_length
    "# rubocop:disable MethodLength\n  " if board.length > 8
  end
end

ConnectCases = proc do |data|
  json = JSON.parse(data)
  cases = []
  json['cases'].each_with_index do |row, i|
    row['index'] = i
    cases << ConnectCase.new(row)
  end
  cases
end

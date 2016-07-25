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
end

ConnectCases = proc do |data|
  i = 0
  json = JSON.parse(data)
  cases = []
  json['cases'].each do |row|
    row = row.merge(row.merge('index' => i))
    cases << ConnectCase.new(row)
    i += 1
  end
  cases
end

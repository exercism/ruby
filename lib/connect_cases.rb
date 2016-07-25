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
      '  ' + board.map(&:inspect).join(",\n      "),
      ']',
      'game = Board.new(board)',
      "assert_equal #{expected.inspect}, game.winner, #{description.inspect}"
    ]
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
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

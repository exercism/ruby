class TournamentCase < OpenStruct
  def test_name
    "test_#{description.tr(' ', '_').tr('()', '')}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def workload
    'Tournament.tally(input)'
  end

  def expect
    indented_heredoc(expected, 'TALLY')
  end

  def input_text
    indented_heredoc(input, 'INPUT')
  end

  private

  def indented_heredoc(string, delimiter)
    [
      "<<-#{delimiter}.gsub(/^ */, '')",
      indent_lines(string),
      indent_line(delimiter)
    ].join("\n")
  end

  def indent_lines(lines, indent = 3)
    lines.map { |line| indent_line(line, indent) }.join("\n")
  end

  def indent_line(line, indent = 2)
    ' ' * indent * 2 + line
  end
end

TournamentCases = proc do |data|
  JSON.parse(data)['valid_inputs']['cases'].map.with_index do |row, i|
    TournamentCase.new(row.merge('index' => i))
  end
end

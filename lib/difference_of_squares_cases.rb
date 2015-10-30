class DifferenceOfSquaresCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def do
    case
    when defined?(square_of_sums)
      "Squares.new(#{square_of_sums}).square_of_sums"
    when defined?(sum_of_squares)
      "Squares.new(#{sum_of_squares}).sum_of_squares"
    when defined?(difference)
      "Squares.new(#{difference}).difference"
    end
  end

  def skipped?
    index > 0
  end

  def expected_formatted
    expected.to_s.reverse.scan(/\d{1,3}/).join('_').reverse
  end
end

DifferenceOfSquaresCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    DifferenceOfSquaresCase.new(row.merge('index' => i))
  end
end

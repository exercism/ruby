class DifferenceOfSquaresCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    "assert_equal #{expected_formatted}, Squares.new(#{number}).#{action}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def action
    return 'difference' if section == 'difference_of_squares'
    section
  end

  def expected_formatted
    expected.to_s.reverse.scan(/\d{1,3}/).join('_').reverse
  end
end

DifferenceOfSquaresCases = proc do |data|
  i = 0
  json = JSON.parse(data)
  cases = []
  %w(square_of_sum sum_of_squares difference_of_squares).each do |section|
    json[section]['cases'].each do |row|
      row = row.merge(row.merge('index' => i, 'section' => section))
      cases << DifferenceOfSquaresCase.new(row)
      i += 1
    end
  end
  cases
end

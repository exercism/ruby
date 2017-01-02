class GrainsCase < OpenStruct
  def test_name
    'test_%s' % description.downcase.tr_s(' ', '_')
  end

  def workload
    fail NotImplementedError
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def underscore_format(number)
    number.to_s.reverse.gsub(/...(?=.)/,'\&_').reverse
  end
end

class GrainsCase::SquareMethod < GrainsCase
  def workload
    return error_assertion if expected < 0

    "assert_equal #{underscore_format(expected)}, Grains.square(#{input})"
  end

  private

  def error_assertion
    "assert_raises(ArgumentError) { Grains.square(#{input}) }"
  end
end

class GrainsCase::TotalMethod < GrainsCase
  def workload
    "assert_equal #{underscore_format(expected)}, Grains.total"
  end
end

GrainsCases = proc do |data|
  data = JSON.parse(data)

  cases = data['square']['cases'].map.with_index do |row, i|
    GrainsCase::SquareMethod.new(row.merge('index' => i))
  end

  cases << GrainsCase::TotalMethod.new(
    data['total'].merge('index' => cases.size)
  )
end

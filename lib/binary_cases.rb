class BinaryCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    return error_assertion if raises_error?
    equality_assertion
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def error_assertion
    "assert_raises(ArgumentError) { #{checked} }"
  end

  def equality_assertion
    "assert_equal #{expected}, #{checked}"
  end

  def checked
    "Binary.new('#{binary}')#{'.to_decimal' unless raises_error?}"
  end

  def raises_error?
    expected.nil?
  end
end

BinaryCases = proc do |data|
  JSON.parse(data)['decimal'].map.with_index do |row, i|
    BinaryCase.new(row.merge('index' => i))
  end
end

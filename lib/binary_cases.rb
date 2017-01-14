require 'exercise_cases'

class BinaryCase < OpenStruct
  def name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def assertion
    raises_error? ? error_assertion : equality_assertion
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def error_assertion
    "assert_raises(ArgumentError) { #{work_load} }"
  end

  def equality_assertion
    "assert_equal #{expected}, #{work_load}"
  end

  def work_load
    "Binary.to_decimal('#{binary}')"
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

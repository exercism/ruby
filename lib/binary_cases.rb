class BinaryCase < OpenStruct
  def name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def assertion
    return compound_assertion if multiple_assertions?
    Assertion.new("'#{binary}'", expected).to_s
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def multiple_assertions?
    binary.is_a?(Array)
  end

  def compound_assertion
    inputs = binary.map { |e| e.gsub(' ', '\ ') }.join(' ')
    %(%w(#{inputs}).each do |input|
      #{Assertion.new('input', expected)}
    end)
  end

  class Assertion
    def initialize(initialization_value, expected)
      @initialization_value = initialization_value
      @expected = expected
    end

    def to_s
      return error_assertion if raises_error?
      equality_assertion
    end

    private

    attr_reader :initialization_value, :expected

    def error_assertion
      "assert_raises(ArgumentError) { #{work_load} }"
    end

    def equality_assertion
      "assert_equal #{expected}, #{work_load}"
    end

    def work_load
      "Binary.new(#{initialization_value})#{'.to_decimal' unless raises_error?}"
    end

    def raises_error?
      expected.to_i == -1
    end
  end
end

BinaryCases = proc do |data|
  JSON.parse(data)['decimal'].map.with_index do |row, i|
    BinaryCase.new(row.merge('index' => i))
  end
end

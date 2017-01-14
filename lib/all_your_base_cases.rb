require 'exercise_cases'

class AllYourBaseCase < OpenStruct
  def test_name
    'test_%s' % description.downcase.tr(' -', '_')
  end

  def workload
    indent(4, (assignments + assertion).join("\n")) + "\n"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def indent(size, text)
    text.lines.each_with_object('') do |line, obj|
      obj << (line == "\n" ? line : ' ' * size + line)
    end
  end

  def assignments
      [
        "digits = #{input_digits}",
        "input_base = #{input_base}",
        "output_base = #{output_base}",
      ]
  end

  def assertion
    return error_assertion unless expected

    [
      "expected = #{expected}",
      "",
      "converted = BaseConverter.convert(input_base, digits, output_base)",
      "",
      "assert_equal expected, converted,",
      indent(13, error_message),
    ]
  end

  def error_assertion
    [
      "",
      "assert_raises ArgumentError do",
      "  BaseConverter.convert(input_base, digits, output_base)",
      "end",
    ]
  end

  def error_message
    %q("Input base: #{input_base}, output base #{output_base}. " \\) \
      "\n" + %q("Expected #{expected} but got #{converted}.")
  end
end

class AllYourBaseCase::PreProcessor
  class << self
    attr_reader :row

    def call(row)
      @row = row

      row.merge('expected' => expected_value)
    end

    private :row
    private

    def expected_value
      return row['expected'] if row['expected']

      if invalid_input_digits? || invalid_bases?
        nil
      elsif row['input_digits'].empty?
        []
      elsif input_of_zero?
        [0]
      else
        handle_special_cases
      end
    end

    def invalid_input_digits?
      row['input_digits'].any? { |x| x < 0 || x >= row['input_base'] }
    end

    def invalid_bases?
      row['input_base'] <= 1 || row['output_base'] <= 1
    end

    def input_of_zero?
      row['input_digits'].all? { |x| x == 0 }
    end

    def handle_special_cases
      [4, 2] if row['input_digits'] == [0, 6, 0]
    end
  end
end

AllYourBaseCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    AllYourBaseCase.new(
      AllYourBaseCase::PreProcessor.call(row).merge(index: i),
    )
  end
end

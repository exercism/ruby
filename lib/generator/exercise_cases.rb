require 'ostruct'
require 'json'

module Generator
  class ExerciseCase < OpenStruct
    using Generator::Underscore

    def name
      'test_%s' % description.underscore
    end

    def skipped
      index.zero? ? '# skip' : 'skip'
    end

    protected

    # indent multi line workloads
    #
    #   indent_lines(
    #     [
    #       "string = #{input.inspect}",
    #       "#{assert} Isogram.is_isogram?(string)"
    #     ], 4
    #   )
    def indent_lines(code, depth, separator = "\n")
      code.join(separator + ' ' * depth)
    end

    # indent multi line workloads with (unindented) blank lines
    #
    #   indent_text(4, lines)
    def indent_text(depth, lines)
      lines.reduce do |obj, line|
        obj << (line == "\n" ? line : ' ' * depth + line)
      end
    end

    # generate heredoc (as part of workload) with optional indentation
    def indented_heredoc(lines, delimiter, depth = 0, delimiter_method = nil)
      [
        "<<-#{delimiter}#{delimiter_method}",
        lines.map { |line| ' ' * depth + line }.join("\n"),
        delimiter
      ].join("\n")
    end

    # e.g.,
    #   "#{assert} Luhn.valid?(#{input.inspect})"
    def assert
      expected ? 'assert' : 'refute'
    end

    # e.g.,
    #   assert_equal { "PigLatin.translate(#{input.inspect})" }
    def assert_equal
      "assert_equal #{expected.inspect}, #{yield}"
    end

    # e.g.,
    #   if raises_error?
    #     assert_raises(ArgumentError) { test_case }
    #   else
    #     assert_equal { test_case }
    #   end
    def raises_error?
      expected.to_i == -1
    end

    # e.g.,
    #   assert_raises(ArgumentError) { test_case }
    def assert_raises(error)
      "assert_raises(#{error}) { #{yield} }"
    end
  end
end

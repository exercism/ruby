require 'ostruct'
require 'json'

module Generator
  class ExerciseCase < OpenStruct
    using Generator::Underscore
    include Assertion

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
    #   indent_text(4, text)
    def indent_text(depth, text)
      text.lines.reduce do |obj, line|
        obj << (line == "\n" ? line : ' ' * depth + line)
      end
    end

    # generate heredoc (as part of workload) with optional indentation
    #
    #    indent_heredoc(["foo", "bar"], 'TEXT', 1)
    def indent_heredoc(lines, delimiter, depth = 0, delimiter_method = nil)
      [
        "<<-#{delimiter}#{delimiter_method}",
        lines.map { |line| ' ' * depth + line }.join("\n"),
        delimiter
      ].join("\n")
    end
  end
end

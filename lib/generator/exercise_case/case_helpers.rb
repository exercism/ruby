module Generator
  class ExerciseCase
    module CaseHelpers
      protected
      def snake_case(string)
        string.gsub(/([A-Z])/, '_\1').downcase
      end

      # Takes a string and indents each line by 'depth' spaces.
      # Will NOT add spaces to empty lines.
      #
      # usage:  indent_by( 2, "line 1\n\nline 2\n" )
      def indent_by(depth, string)
        string.gsub(/^(.+)$/, "#{' ' * depth}\\1")
      end

      # generate heredoc (as part of workload) with optional indentation
      #
      #    indent_heredoc(["foo", "bar"], 'TEXT', 1)
      def indent_heredoc(lines, delimiter, depth = 0, delimiter_method = nil)
        [
          "<<~#{delimiter}#{delimiter_method}",
          lines.map { |line| ' ' * depth + line }.join("\n"),
          delimiter
        ].join("\n")
      end

      # combine array of string elements into a single string
      # as part of workload with optional separator
      #
      #  example usage:  to_string(["foo", "bar"])
      #  example output: "foo\nbar"
      def to_string(phrases, separator = "\n")
        phrases.join(separator).inspect
      end

      def underscore(number)
        raise ArgumentError, "#{number.inspect} is not an Integer" unless number.is_a? Integer

        number.to_s.reverse.gsub(/...(?=.)/, '\&_').reverse
      end
    end
  end
end

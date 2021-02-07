require_relative '../../test_helper'

module Generator
  class ExerciseCase
    class CaseHelpersTest < Minitest::Test
      include CaseHelpers

      def test_underscore_with_integer
        assert_equal '1_234_567', underscore(1_234_567)
      end

      def test_underscore_with_string
        err = assert_raises(ArgumentError) { underscore('A string') }
        expected_message = /"A string" is not an Integer/
        assert_match expected_message, err.message
      end

      def test_snake_case
        string = 'someCamelCaseThing'
        assert_equal 'some_camel_case_thing', snake_case(string)
      end

      def test_indent_by
        string = 'hello world'
        assert_equal '  hello world', indent_by(2, string)
      end

      def test_indent_by_on_multiline_string
        string = "hello\nworld\n"
        assert_equal "  hello\n  world\n", indent_by(2, string)
      end

      def test_indent_by_on_multiline_string_without_newline
        string = "hello\nworld"
        assert_equal "  hello\n  world", indent_by(2, string)
      end

      # rubocop:disable Naming/VariableNumber
      def test_indent_by_multiple_calls_on_multiline_string
        string = "hello\nworld\n"
        step_1 = indent_by(1, string)
        assert_equal "   hello\n   world\n", indent_by(2, step_1)
      end
      # rubocop:enable Naming/VariableNumber

      def test_indent_by_ignores_blank_lines
        string = "hello\n\nworld"
        assert_equal "  hello\n\n  world", indent_by(2, string)
      end

      class HeredocCase
        include CaseHelpers

        def workload
          indent_heredoc(%w[foo bar], 'TEXT', 1)
        end
      end

      def test_heredoc
        expected = "<<~TEXT\n foo\n bar\nTEXT"
        assert_equal expected, HeredocCase.new.workload
      end

      class ToStringCase
        include CaseHelpers

        def workload(phrases)
          to_string(phrases)
        end
      end

      def test_to_string_with_two_strings
        phrases = %w[foo bar]
        expected = "foo\nbar".inspect
        assert_equal expected, ToStringCase.new.workload(phrases)
      end

      def test_to_string_with_string_and_integer
        phrases = ["foo", 123]
        expected = "foo\n123".inspect
        assert_equal expected, ToStringCase.new.workload(phrases)
      end

      def test_to_string_with_string_and_nil
        phrases = ["foo", nil]
        expected = "foo\n".inspect
        assert_equal expected, ToStringCase.new.workload(phrases)
      end
    end
  end
end

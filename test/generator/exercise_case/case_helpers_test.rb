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

      def test_indent_by_multiple_calls_on_multiline_string
        string = "hello\nworld\n"
        step_1 = indent_by(1, string)
        assert_equal "   hello\n   world\n", indent_by(2, step_1)
      end

      def test_indent_by_ignores_blank_lines
        string = "hello\n\nworld"
        assert_equal "  hello\n\n  world", indent_by(2, string)
      end

      class MultiLineCase
        include CaseHelpers

        def workload
          indent_lines(['foo', 'bar'], 1)
        end
      end
      def test_indent_multiline_workloads
        expected = "foo\n bar"
        assert_equal expected, MultiLineCase.new.workload
      end

      class BlankLineCase
        include CaseHelpers

        def workload
          indent_text(2, "foo\n\nbar\n")
        end
      end
      def test_indent_multiline_workloads_with_blank_lines
        expected = "foo\n\n  bar\n"
        assert_equal expected, BlankLineCase.new.workload
      end

      class HeredocCase
        include CaseHelpers

        def workload
          indent_heredoc(["foo", "bar"], 'TEXT', 1)
        end
      end
      def test_heredoc
        expected = "<<-TEXT\n foo\n bar\nTEXT"
        assert_equal expected, HeredocCase.new.workload
      end
    end
  end
end

require_relative '../../test_helper'

module Generator
  class ExerciseCase
    class CaseHelpersTest < Minitest::Test
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

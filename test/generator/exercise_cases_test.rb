require_relative '../test_helper'

module Generator
  class ExerciseCaseTest < Minitest::Test
    def test_name
      assert_equal 'test_foo', ExerciseCase.new(description: 'foo').name
    end

    def test_skipped_index_zero
      assert_equal '# skip', ExerciseCase.new(index: 0).skipped
    end

    def test_skipped_index_nonzero
      assert_equal 'skip', ExerciseCase.new(index: 12).skipped
    end

    class MultiLineCase < ExerciseCase
      def workload
        indent_lines(['foo','bar'], 1)
      end
    end
    def test_indent_multiline_workloads
      expected = "foo\n bar"
      assert_equal expected, MultiLineCase.new.workload
    end

    class BlankLineCase < ExerciseCase
      def workload
        indent_text(2, ["foo\n", "\n", "bar\n"])
      end
    end
    def test_indent_multiline_workloads_with_blank_lines
      expected = "foo\n\n  bar\n"
      assert_equal expected, BlankLineCase.new.workload
    end
  end
end

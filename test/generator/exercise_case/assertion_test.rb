require_relative '../../test_helper'

module Generator
  class ExerciseCase
    class AssertionTest < Minitest::Test
      def test_assert
        subject = Object.new.extend(Assertion)
        result = subject.assert_or_refute(true, 'value')
        assert_equal "assert value\n", result
      end

      def test_refute
        subject = Object.new.extend(Assertion)
        result = subject.assert_or_refute(false, 'value')
        assert_equal "refute value\n", result
      end

      def test_assert_equal
        subject = Object.new.extend(Assertion)
        result = subject.assert_equal(4, 2 + 2)
        assert_equal "assert_equal 4, 4\n", result
      end

      def test_assert_equal_when_nil
        subject = Object.new.extend(Assertion)
        result = subject.assert_equal(nil, 2 + 2)
        assert_equal "assert_nil 4\n", result
      end

      def test_assert_raises
        subject = Object.new.extend(Assertion)
        result = subject.assert_raises(ArgumentError, "2.plus('two')")
        assert_equal "assert_raises(ArgumentError) do\n  2.plus('two')\nend\n", result
      end
    end
  end
end

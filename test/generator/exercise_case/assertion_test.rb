require_relative '../../test_helper'

module Generator
  class ExerciseCase
    class AssertionTest < Minitest::Test
      def test_assert
        test_case = OpenStruct.new(expected: true)
        test_case.extend(Assertion)
        assert_equal 'assert', test_case.assert
      end

      def test_refute
        test_case = OpenStruct.new(expected: false)
        test_case.extend(Assertion)
        assert_equal 'refute', test_case.assert
      end

      def test_assert_equal
        test_case = OpenStruct.new(expected: 2)
        test_case.extend(Assertion)
        assert_equal "assert_equal 2, 4", test_case.assert_equal { 1 + 3 }
      end

    end
  end
end

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

    end
  end
end

require_relative '../../test_helper'

module Generator
  class ExerciseCase
    class AssertionTest < Minitest::Test
      def test_assert
        test_case = OpenStruct.new(canonical: {'expected' => true})
        test_case.extend(Assertion)
        assert_equal 'assert', test_case.assert
      end

      def test_refute
        test_case = OpenStruct.new(canonical: {'expected' => false})
        test_case.extend(Assertion)
        assert_equal 'refute', test_case.assert
      end

      def test_assert_equal
        test_case = OpenStruct.new(canonical: {'expected' => 2})
        test_case.extend(Assertion)
        assert_equal "assert_equal 2, 4", test_case.assert_equal { 1 + 3 }
      end

      def test_assert_equal_when_nil
        test_case = OpenStruct.new(canonical: {'expected' => nil})
        test_case.extend(Assertion)
        assert_equal "assert_nil 4", test_case.assert_equal { 1 + 3 }
      end

      def test_raises_error
        test_case = OpenStruct.new(canonical: {'expected' => -1})
        test_case.extend(Assertion)
        assert test_case.raises_error?
      end

      def test_does_not_raise_error
        test_case = OpenStruct.new(canonical: {'expected' => 'cute kitties'})
        test_case.extend(Assertion)
        refute test_case.raises_error?
      end

      def test_assert_raises
        test_case = OpenStruct.new(canonical: {})
        test_case.extend(Assertion)
        assert_equal(
          "assert_raises(ArgumentError) { 4 }",
          test_case.assert_raises(ArgumentError) { 2 + 2 }
        )
      end
    end
  end
end

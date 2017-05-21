require_relative '../test_helper'

module Generator
  class ExerciseCaseTest < Minitest::Test
    def test_name
      assert_equal 'test_foo', ExerciseCase.new(case_data: {'description' => 'foo'}).name
    end

    def test_skipped_index_zero
      assert_equal '# skip', ExerciseCase.new(case_data: {}).skipped(0)
    end

    def test_skipped_index_nonzero
      assert_equal 'skip', ExerciseCase.new(case_data: {}).skipped(1)
    end
  end
end

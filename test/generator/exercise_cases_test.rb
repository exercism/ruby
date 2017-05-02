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
  end
end

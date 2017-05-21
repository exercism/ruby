require_relative '../test_helper'

module Generator
  class ExerciseCaseTest < Minitest::Test
    def test_name
      subject = ExerciseCase.new(canonical: OpenStruct.new('description' => 'foo'))
      assert_equal 'test_foo', subject.name
    end

    def test_skipped_index_zero
      assert_equal '# skip', ExerciseCase.new(canonical: nil).skipped(0)
    end

    def test_skipped_index_nonzero
      assert_equal 'skip', ExerciseCase.new(canonical: nil).skipped(1)
    end
  end
end

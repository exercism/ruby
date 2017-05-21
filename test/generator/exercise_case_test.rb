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

    def test_forwarding_to_canonical
      mock_canonical = Minitest::Mock.new
      mock_canonical.expect :key, 'fake value'
      subject = ExerciseCase.new(canonical: mock_canonical)
      subject.key
      mock_canonical.verify
    end

    def test_method_mising_calls_super
      subject = ExerciseCase.new(canonical: nil)
      assert_raises NoMethodError do
        subject.key
      end
    end

    def test_true_respond_to?
      subject = ExerciseCase.new(canonical: OpenStruct.new('key' => 'value'))
      assert subject.respond_to?(:key)
    end

    def test_false_respond_to?
      subject = ExerciseCase.new(canonical: OpenStruct.new({}))
      refute subject.respond_to?(:key)
    end
  end
end

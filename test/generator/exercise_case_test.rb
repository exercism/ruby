require_relative '../test_helper'

module Generator
  class ExerciseCaseTest < Minitest::Test
    # We double-up on 'test' here because the method is called 'test_name'
    def test_test_name
      mock_canonical = Minitest::Mock.new.expect(:description, 'foo')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_foo', subject.test_name
    end

    def test_test_name_with_trailing_whitespace
      mock_canonical = Minitest::Mock.new.expect(:description, 'foo ')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_foo', subject.test_name
    end

    def test_test_name_with_leading_whitespace
      mock_canonical = Minitest::Mock.new.expect(:description, ' foo')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_foo', subject.test_name
    end

    def test_test_name_with_punctuation
      mock_canonical = Minitest::Mock.new.expect(:description, 'comma,colon:question_mark?')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_comma_colon_question_mark', subject.test_name
    end

    def test_test_name_no_trailing_underscores
      mock_canonical = Minitest::Mock.new.expect(:description, 'periods.....')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_periods', subject.test_name
    end

    def test_test_name_no_multiple_internal_underscores
      mock_canonical = Minitest::Mock.new.expect(:description, 'a...b')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_a_b', subject.test_name
    end

    def test_test_name_with_uppercase_letters
      mock_canonical = Minitest::Mock.new.expect(:description, 'FOO')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_equal 'test_foo', subject.test_name
    end

    def test_skip
      assert_equal 'skip', ExerciseCase.new(canonical: nil).skip(false)
    end

    def test_skip_commented_out
      assert_equal '# skip', ExerciseCase.new(canonical: nil).skip(true)
    end

    def test_forwarding_to_canonical
      mock_canonical = Minitest::Mock.new
      mock_canonical.expect :key, 'fake value'
      subject = ExerciseCase.new(canonical: mock_canonical)
      subject.key
      mock_canonical.verify
    end

    def test_method_mising_calls_super
      mock_canonical = Minitest::Mock.new
      subject = ExerciseCase.new(canonical: mock_canonical)
      error = assert_raises NoMethodError do
        subject.unknown
      end
      expected_message = /undefined method `unknown' for #<Generator::ExerciseCase/
      assert_match expected_message, error.message
    end

    def test_respond_to_forwards_request
      mock_canonical = Minitest::Mock.new.expect(:key, 'value')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert_respond_to subject, :key
    end

    def test_false_respond_to?
      mock_canonical = Minitest::Mock.new
      subject = ExerciseCase.new(canonical: mock_canonical)
      refute_respond_to subject, :nonexisting_key
    end

    def test_workload
      subject = ExerciseCase.new(canonical: nil)
      error = assert_raises(StandardError) { subject.workload }
      expected_message = /You need to subclass and implement the 'workload' method/
      assert_match expected_message, error.message
    end

    def test_error_expected?
      mock_canonical = Minitest::Mock.new.expect(:expected_error, 'foo')
      subject = ExerciseCase.new(canonical: mock_canonical)
      assert subject.error_expected?
    end

    def test_not_error_expected?
      mock_canonical = Minitest::Mock.new
      subject = ExerciseCase.new(canonical: mock_canonical)
      refute subject.error_expected?
    end

    class ImplementedCase < ExerciseCase
      def workload
        ["the workload\n", "more workload\n"].join
      end
    end

    def test_to_s_without_skip
      mock_canonical = Minitest::Mock.new.expect(:description, 'the description')
      subject = ImplementedCase.new(canonical: mock_canonical)
      expected = [
        "  def test_the_description\n",
        "    # skip\n",
        "    the workload\n",
        "    more workload\n",
        "  end\n"
      ].join

      assert_equal expected, subject.to_s(true)
    end

    def test_to_s_with_skip
      mock_canonical = Minitest::Mock.new.expect(:description, 'the description')
      subject = ImplementedCase.new(canonical: mock_canonical)
      expected = [
        "  def test_the_description\n",
        "    skip\n",
        "    the workload\n",
        "    more workload\n",
        "  end\n"
      ].join

      assert_equal expected, subject.to_s
    end

    def test_format_workload_as_array_with_newlines
      workload = ["the workload\n", "more workload\n"]
      expected = "the workload\nmore workload\n"
      subject = ExerciseCase.new(canonical: nil)
      assert_equal expected, subject.format_workload(workload)
    end

    def test_format_workload_as_array_without_newlines
      workload = ["the workload", "more workload"]
      expected = "the workload\nmore workload\n"
      subject = ExerciseCase.new(canonical: nil)
      assert_equal expected, subject.format_workload(workload)
    end

    def test_format_workload_as_string_with_last_newline
      workload = "the workload\nmore workload\n"
      expected = "the workload\nmore workload\n"
      subject = ExerciseCase.new(canonical: nil)
      assert_equal expected, subject.format_workload(workload)
    end

    def test_format_workload_as_string_without_last_newline
      workload = "the workload\nmore workload"
      expected = "the workload\nmore workload\n"
      subject = ExerciseCase.new(canonical: nil)
      assert_equal expected, subject.format_workload(workload)
    end
  end
end

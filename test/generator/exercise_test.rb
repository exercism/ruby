require_relative '../test_helper'

module Generator
  class ExerciseTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_version
      subject = Exercise.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 1, subject.version
    end

    def test_slug
      subject = Exercise.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 'alpha', subject.slug
    end

    def test_update_tests_version
      mock_file = Minitest::Mock.new.expect :write, '2'.length, [2]
      subject = Exercise.new(paths: FixturePaths, slug: 'alpha')
      # Verify iniital condition from fixture file
      assert_equal 1, subject.tests_version.to_i
      File.stub(:open, true, mock_file) do
        assert_equal 2, subject.update_tests_version
      end
      mock_file.verify
    end

    def test_update_example_solution
      expected_content = "# This is the example\n\nclass BookKeeping\n  VERSION = 1\nend\n"
      mock_file = Minitest::Mock.new.expect :write, expected_content.length, [expected_content]
      subject = Exercise.new(paths: FixturePaths, slug: 'alpha')
      File.stub(:open, true, mock_file) do
        assert_equal expected_content, subject.update_example_solution
      end
      mock_file.verify
    end

    def test_build_tests
      # Q: Is the pain here caused by:
      # a) Exercise `including` everything rather than using composition?
      # b) Trying to verify the expected content.
      # c) The expected content being too long
      #
      # Q: Where in the call stack should the testing logically stop?
      # A: It should be able to stop when minitest_tests is called with the correct arguments.
     expected_content =<<TESTS_FILE
#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'alpha'

# Hi. I am a custom comment

# Common test data version: 123456789
class AlphaTest < Minitest::Test
  def test_add_2_numbers
    # skip
    assert true
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
TESTS_FILE
      mock_file = Minitest::Mock.new.expect :write, expected_content.length, [expected_content]
      subject = Exercise.new(paths: FixturePaths, slug: 'alpha')
      GitCommand.stub(:abbreviated_commit_hash, '123456789') do
        File.stub(:open, true, mock_file) do
          assert_equal expected_content, subject.build_tests
        end
      end
      mock_file.verify
      # Don't pollute the namespace
      Object.send(:remove_const, :AlphaCase)
    end

    def test_name
      subject = Exercise.new(paths: FixturePaths, slug: 'alpha-beta')
      assert_equal 'alpha_beta', subject.name
    end
  end

  class LoggingExerciseTest < Minitest::Test
    def test_build_tests
      mock_exercise = Minitest::Mock.new
      mock_exercise.expect :build_tests, nil
      mock_exercise.expect :slug, 'alpha'
      mock_exercise.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ['Generated alpha tests version 2']

      subject = LoggingExercise.new(exercise: mock_exercise, logger: mock_logger)
      subject.build_tests

      mock_exercise.verify
    end

    def test_update_tests_version
      mock_exercise = Minitest::Mock.new
      mock_exercise.expect :update_tests_version, nil
      mock_exercise.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Incremented tests version to 2']

      subject = LoggingExercise.new(exercise: mock_exercise, logger: mock_logger)
      subject.update_tests_version

      mock_exercise.verify
    end

    def test_update_example_solution
      mock_exercise = Minitest::Mock.new
      mock_exercise.expect :update_example_solution, nil
      mock_exercise.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Updated version in example solution to 2']

      subject = LoggingExercise.new(exercise: mock_exercise, logger: mock_logger)
      subject.update_example_solution

      mock_exercise.verify
    end
  end
end

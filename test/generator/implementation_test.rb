require_relative '../test_helper'
require 'generator/git_command'

module Generator
  class ImplementationTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/ruby'
    )

    def test_version
      exercise = Minitest::Mock.new.expect :slug, 'alpha'
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject = Implementation.new(repository: repository, exercise: exercise)
      assert_equal 1, subject.version
    end

    def test_update_tests_version
      mock_file = Minitest::Mock.new.expect :write, '2'.length, [2]
      exercise = Exercise.new(slug: 'alpha')
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject = Implementation.new(repository: repository, exercise: exercise)
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
      exercise = Exercise.new(slug: 'alpha')
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject = Implementation.new(repository: repository, exercise: exercise)
      File.stub(:open, true, mock_file) do
        assert_equal expected_content, subject.update_example_solution
      end
      mock_file.verify
    end

    def test_build_tests
      # Q: Is the pain here caused by:
      # a) Implementation `including` everything rather than using composition?
      # b) Trying to verify the expected content.
      # c) The expected content being too long
      #
      # Q: Where in the call stack should the testing logically stop?
      # A: It should be able to stop when minitest_tests is called with the correct arguments.
     expected_content =<<TESTS_FILE
require 'minitest/autorun'
require_relative 'alpha'

# Hi. I am a custom comment

# Common test data version: 123456789
class AlphaTest < Minitest::Test
  def test_add_2_numbers
    # skip
    assert true
  end

end
TESTS_FILE
      mock_file = Minitest::Mock.new.expect :write, expected_content.length, [expected_content]
      exercise = Exercise.new(slug: 'alpha')
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject = Implementation.new(repository: repository, exercise: exercise)
      GitCommand.stub(:abbreviated_commit_hash, '123456789') do
        File.stub(:open, true, mock_file) do
          assert_equal expected_content, subject.build_tests
        end
      end
      mock_file.verify
      # Don't pollute the namespace
      Object.send(:remove_const, :AlphaCase)
    end
  end

  class LoggingImplementationTest < Minitest::Test
    def test_build_tests
      exercise = Exercise.new(slug: 'alpha')
      mock_implementation = Minitest::Mock.new
      mock_implementation.expect :build_tests, nil
      mock_implementation.expect :exercise, exercise
      mock_implementation.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ['Generated alpha tests version 2']

      subject = LoggingImplementation.new(implementation: mock_implementation, logger: mock_logger)
      subject.build_tests

      mock_implementation.verify
    end

    def test_update_tests_version
      mock_implementation = Minitest::Mock.new
      mock_implementation.expect :update_tests_version, nil
      mock_implementation.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Incremented tests version to 2']

      subject = LoggingImplementation.new(implementation: mock_implementation, logger: mock_logger)
      subject.update_tests_version

      mock_implementation.verify
    end

    def test_update_example_solution
      mock_implementation = Minitest::Mock.new
      mock_implementation.expect :update_example_solution, nil
      mock_implementation.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Updated version in example solution to 2']

      subject = LoggingImplementation.new(implementation: mock_implementation, logger: mock_logger)
      subject.update_example_solution

      mock_implementation.verify
    end
  end
end

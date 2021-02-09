require_relative '../test_helper'
require 'generator/git_command'

module Generator
  class ImplementationTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/ruby'
    )

    def test_slug
      exercise = Minitest::Mock.new.expect :slug, 'alpha'
      repository = nil
      subject = Implementation.new(repository: repository, exercise: exercise)
      assert_equal 'alpha', subject.slug
    end

    def test_build_tests
      # Q: Is the pain here caused by:
      # a) Implementation `including` everything rather than using composition?
      # b) Trying to verify the expected content.
      # c) The expected content being too long
      #
      # Q: Where in the call stack should the testing logically stop?
      # A: It should be able to stop when minitest_tests is called with the correct arguments.
      expected_content = <<~TESTS_FILE
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
      # mock_implementation.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ['Generated alpha tests']

      subject = LoggingImplementation.new(implementation: mock_implementation, logger: mock_logger)
      subject.build_tests

      mock_implementation.verify
    end
  end
end

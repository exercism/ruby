require_relative '../test_helper'

module Generator
  class RepositoryTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_version
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 1, subject.version
    end

    def test_slug
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 'alpha', subject.slug
    end

    def test_update_tests_version
      mock_file = Minitest::Mock.new.expect :write, '2'.length, [2]
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      # Verify iniital condition from fixture file
      assert_equal 1, subject.tests_version.to_i
      File.stub(:open, true, mock_file) do
        assert_equal 2, subject.update_tests_version
      end
      mock_file.verify
    end

    def test_update_example_solution
      mock_example_solution = Minitest::Mock.new.expect :update_version, nil, [1]
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject.define_singleton_method(:example_solution) { mock_example_solution }
      subject.update_example_solution
      mock_example_solution.verify
    end

    def test_create_tests_file
      # Q: Is the pain here caused by:
      # a) Repository `including` everything rather than using composition?
      # b) Trying to verify the expected content.
      # c) The expected content being too long
      #
      # Q: Where in the call stack should the testing logically stop?
      # A: It should be able to stop when minitest_tests is called with the correct arguments.
      expected_content = "#!/usr/bin/env ruby\nrequire 'minitest/autorun'\nrequire_relative 'alpha'\n\n# Hi. I am a custom comment\n\n# Common test data version: 123456789\nclass AlphaTest < Minitest::Test\n  def test_add_2_numbers\n    # skip\n    assert true\n  end\n\n  # Problems in exercism evolve over time, as we find better ways to ask\n  # questions.\n  # The version number refers to the version of the problem you solved,\n  # not your solution.\n  #\n  # Define a constant named VERSION inside of the top level BookKeeping\n  # module, which may be placed near the end of your file.\n  #\n  # In your file, it will look like this:\n  #\n  # module BookKeeping\n  #   VERSION = 1 # Where the version number matches the one in the test.\n  # end\n  #\n  # If you are curious, read more about constants on RubyDoc:\n  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html\n\n  def test_bookkeeping\n    skip\n    assert_equal 1, BookKeeping::VERSION\n  end\nend\n"
      mock_file = Minitest::Mock.new.expect :write, expected_content.length, [expected_content]
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      GitCommand.stub(:abbreviated_commit_hash, '123456789') do
        File.stub(:open, true, mock_file) do
          assert_equal expected_content, subject.create_tests_file
        end
      end
      mock_file.verify
      # Don't pollute the namespace
      Object.send(:remove_const, :AlphaCase)
    end

    def test_exercise_name
      subject = Repository.new(paths: FixturePaths, slug: 'alpha-beta')
      assert_equal 'alpha_beta', subject.exercise_name
    end
  end

  class LoggingRepositoryTest < Minitest::Test
    def test_create_tests_file
      mock_repository = Minitest::Mock.new
      mock_repository.expect :create_tests_file, nil
      mock_repository.expect :slug, 'alpha'
      mock_repository.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ['Generated alpha tests version 2']

      subject = LoggingRepository.new(repository: mock_repository, logger: mock_logger)
      subject.create_tests_file

      mock_repository.verify
    end

    def test_update_tests_version
      mock_repository = Minitest::Mock.new
      mock_repository.expect :update_tests_version, nil
      mock_repository.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Incremented tests version to 2']

      subject = LoggingRepository.new(repository: mock_repository, logger: mock_logger)
      subject.update_tests_version

      mock_repository.verify
    end

    def test_update_example_solution
      mock_repository = Minitest::Mock.new
      mock_repository.expect :update_example_solution, nil
      mock_repository.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Updated version in example solution to 2']

      subject = LoggingRepository.new(repository: mock_repository, logger: mock_logger)
      subject.update_example_solution

      mock_repository.verify
    end
  end
end

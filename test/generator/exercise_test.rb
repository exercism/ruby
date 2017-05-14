require_relative '../test_helper'

module Generator
  class ExerciseTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_version
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject = Exercise.new(repository: repository)
      assert_equal 1, subject.version
    end

    def test_update_tests_version
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')
      # Verify iniital condition from fixture file
      assert_equal 1, repository.tests_version.to_i

      mock_file = Minitest::Mock.new.expect :write, '2'.length, [2]
      subject = Exercise.new(repository: repository)
      File.stub(:open, true, mock_file) do
        assert_equal 2, subject.update_tests_version
      end
      mock_file.verify
    end

    def test_update_example_solution
      repository = Repository.new(paths: FixturePaths, slug: 'alpha')

      expected_content = "# This is the example\n\nclass BookKeeping\n  VERSION = 1\nend\n"

      mock_file = Minitest::Mock.new.expect :write, expected_content.length, [expected_content]
      subject = Exercise.new(repository: repository)
      File.stub(:open, true, mock_file) do
        assert_equal expected_content, subject.update_example_solution
      end
      mock_file.verify
    end


      mock_repository = Minitest::Mock.new
      mock_repository.expect :tests_version, mock_solution_file
      mock_repository.expect :example_solution, mock_solution_file

      subject = Exercise.new(repository: mock_repository)
      assert_equal expected_content, subject.update_example_solution

      mock_repository.verify
      mock_solution_file.verify
    end

#   will replace later
#    def test_build_tests
#    end
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

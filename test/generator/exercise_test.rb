require_relative '../test_helper'

module Generator
  class ExerciseTest < Minitest::Test
    def test_version
      mock_version_file = Minitest::Mock.new.expect :to_i, 1
      mock_repository = Minitest::Mock.new.expect :tests_version, mock_version_file

      subject = Exercise.new(repository: mock_repository)
      assert_equal 1, subject.version

      mock_repository.verify
      mock_version_file.verify
    end

    def test_update_tests_version
      mock_version_file = Minitest::Mock.new
      mock_version_file.expect :increment, 2
      mock_repository = Minitest::Mock.new.expect :tests_version, mock_version_file

      subject = Exercise.new(repository: mock_repository)
      assert_equal 2, subject.update_tests_version

      mock_repository.verify
      mock_version_file.verify
    end

    def test_update_example_solution
      expected_content = "# This is the example\n\nclass BookKeeping\n  VERSION = 1\nend\n"

      mock_solution_file = Minitest::Mock.new
      mock_solution_file.expect :to_i, 1
      mock_solution_file.expect :update_version, expected_content, [1]

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

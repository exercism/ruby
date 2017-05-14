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

     mock_repository = Minitest::Mock.new
     mock_template_values = Minitest::Mock.new

     mock_template_file = Minitest::Mock.new.expect :to_s, nil
     mock_repository.expect :tests_template, mock_template_file

     subject = Exercise.new(repository: mock_repository)
     subject.stub :template_values, mock_template_values do

       mock_minitest_file = Minitest::Mock.new.expect(:generate, expected_content,
         [template: mock_template_file, values: mock_template_values])

       mock_repository.expect :minitest_tests, mock_minitest_file

       assert_equal expected_content, subject.build_tests

       mock_repository.verify
       mock_minitest_file.verify
       mock_template_file.verify
     end
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

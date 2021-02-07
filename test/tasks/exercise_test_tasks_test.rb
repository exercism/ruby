require_relative '../test_helper'
require 'tasks/exercise'
require 'tasks/exercise_test_tasks'

class ExerciseTestTasksTest < Minitest::Test
  def test_all_exercises_task
    setup_rake

    # TODO: Change to `stub :all` once concept exercises pass
    Exercise.stub :practice, ['test1', 'test2'] do
      ExerciseTestTasks.new(options: '')

      assert_equal ['test1', 'test2'], Rake::Task['exercises'].prerequisites
      assert_equal 'Run the tests for all exercises', Rake::Task['exercises'].comment
    end
  end

  def test_individual_exercise_tasks
    setup_rake

    Exercise.stub :concept, [] do
      Exercise.stub :practice, ['test1', 'test2'] do
        mock_test_runner_instance = Minitest::Mock.new
        mock_test_runner_instance.expect :run, nil
        mock_test_runner_instance.expect :run, nil

        mock_test_runner = Minitest::Mock.new
        mock_test_runner.expect(
          :new,
          mock_test_runner_instance,
          [exercise: 'test1', test_options: '-p']
        )
        mock_test_runner.expect(
          :new,
          mock_test_runner_instance,
          [exercise: 'test2', test_options: '-p']
        )

        ExerciseTestTasks.new(options: '-p', test_runner: mock_test_runner)

        Rake::Task['test1'].invoke
        Rake::Task['test2'].invoke

        mock_test_runner.verify
        mock_test_runner_instance.verify
      end
    end
  end

  def setup_rake
    Rake.application = Rake::Application.new
    Rake::TaskManager.record_task_metadata = true
  end
end

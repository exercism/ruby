require_relative '../test_helper'
require 'tasks/exercise'
require 'tasks/exercise_test_tasks'

class ExerciseTestTasksTest < Minitest::Test
  def test_all_exercises_task
    setup_rake

    Exercise.stub :all, ['test1', 'test2'] do
      ExerciseTestTasks.new(options: '')

      assert_equal %w[test1 test2], Rake::Task['exercises'].prerequisites
      assert_equal 'Run the tests for all exercises', Rake::Task['exercises'].comment
    end
  end

  def setup_rake
    Rake.application = Rake::Application.new
    Rake::TaskManager.record_task_metadata = true
  end
end

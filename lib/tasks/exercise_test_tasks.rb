require 'rake/dsl_definition'

require_relative 'exercise'
require_relative 'exercise_tests_runner'

class ExerciseTestTasks
  include Rake::DSL

  def initialize(options:, test_runner: ExerciseTestsRunner)
    @options = options
    @test_runner = test_runner

    define
  end

  def define
    define_task_for_all_exercises

    exercises.each { |exercise| define_task_for(exercise) }
  end

  private

  def exercises
    @exercises ||= Exercise.all
  end

  def define_task_for_all_exercises
    desc 'Run the tests for all exercises'
    task exercises: exercises
  end

  def define_task_for(exercise)
    task exercise do
      @test_runner.new(exercise: exercise, test_options: @options).run
    end
  end
end

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

    #Exercise.concept.each { |exercise| define_task_for(exercise) }
    Exercise.practice.each { |exercise| define_task_for(exercise) }
  end

  private
  def define_task_for_all_exercises
    desc 'Run the tests for all exercises'
    # TODO: Also add concept exercises
    task exercises: Exercise.practice
  end

  def define_task_for(exercise)
    task exercise do
      @test_runner.new(exercise: exercise, test_options: @options).run
    end
  end
end

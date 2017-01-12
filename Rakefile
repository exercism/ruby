require 'rake'
require 'rake/testtask'

require_relative 'lib/tasks/exercise_test_tasks'

task default: 'test'

desc 'Run individual exercises or run all development and exercise tests'
task :test do
  Rake::Task['test:dev'].invoke
  Rake::Task['test:exercises'].invoke
end

namespace :test do
  flags = ARGV.drop_while { |e| e != '--' }.drop(1).join(' ')

  desc 'Run all development tests located in the test directory'
  Rake::TestTask.new :dev do |task|
    task.options = flags
    task.pattern = 'test/**/*_test.rb'
  end

  ExerciseTestTasks.new options: flags
end

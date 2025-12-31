require 'rake'
require 'rake/testtask'

require_relative 'lib/tasks/exercise_test_tasks'

task default: %i[test rubocop]

desc 'Run individual exercises or run all development and exercise tests'
task :test do
  Rake::Task['test:dev'].invoke
  Rake::Task['test:exercises'].invoke
end

desc 'Run Rubocop'
task :rubocop do
  system('rubocop --display-cop-names')
end

desc "Run generator for specefic exercise"
task :generate, [:exercise] do |_t, argumments|
  system("./bin/generate --exercise #{argumments[:exercise]}")
end

desc "Run generator for all exercises"
task :generate_all do
  system("./bin/generate --all")
end

desc "Verify templates for all exercises"
task :verify do
  system("./bin/generate --verify")
end

namespace :test do
  flags = ARGV.drop_while { |e| e != '--' }.drop(1).join(' ')

  desc 'Run all development tests located in the test directory'
  Rake::TestTask.new :dev do |task|
    task.options = flags
    task.pattern = FileList['test/**/*_test.rb'].exclude('test/generator/**/*')
  end

  Rake::TestTask.new :generator do |task|
    task.options = flags
    task.pattern = 'generatorv2/test/**/*_test.rb'
  end

  ExerciseTestTasks.new options: flags
end

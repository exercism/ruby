require 'rake'
require 'rake/testtask'

desc 'rake with no argument will run "rake test"'
task default: :test

Rake::TestTask.new do |task|
  task.pattern = 'test/**/*_test.rb'
end

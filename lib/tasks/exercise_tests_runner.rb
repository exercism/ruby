require 'rake/file_utils_ext'
require 'tmpdir'

class ExerciseTestsRunner
  include Rake::FileUtilsExt

  def initialize(exercise:, test_options: '')
    @exercise = exercise
    @test_options = test_options
  end

  def run
    puts "\n\n#{'-' * 64}\nrunning tests for: #{@exercise}"

    Dir.mktmpdir(@exercise.slug) do |dir|
      setup_exercise_files_in(dir)
      run_exercise_tests_in(dir)
    end
  end

  private

  def setup_exercise_files_in(dir)
    FileUtils.cp_r @exercise.directory, dir
    FileUtils.mv "#{dir}/#{@exercise.example_file}", "#{dir}/#{@exercise.testable_example_file}"
  end

  def run_exercise_tests_in(dir)
    ruby "-I lib -r disable_skip.rb #{dir}/#{@exercise.test_file} #{@test_options}"
  end
end

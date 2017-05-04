require_relative '../test_helper'
require 'tmpdir'

class ExerciseTest < Minitest::Test
  def test_all
    Dir.mktmpdir('exercise-test') do |dir|
      FileUtils.mkdir "#{dir}/test"
      FileUtils.mkdir "#{dir}/test2"
      FileUtils.touch "#{dir}/TRACK_HINTS.md"

      FileList.stub :[], FileList["#{dir}/*"] do
        assert_equal true, Exercise.all.all? { |e| e.instance_of?(Exercise) }
        assert_equal ['test', 'test2'], Exercise.all.map(&:name)
      end
    end
  end

  def test_name
    exercise = Exercise.new('name')
    assert_equal 'name', exercise.name
  end

  def test_to_s
    exercise = Exercise.new('name')
    assert_equal 'name', exercise.to_s
  end

  def test_directory
    exercise = Exercise.new('exercise_name')
    assert_equal 'exercises/exercise_name/.', exercise.directory
  end

  def test_example_file
    mock_exist = Minitest::Mock.new
    mock_exist.expect(:call, true, ['exercises/alpha/./.meta/solutions/alpha.rb'])
    File.stub(:exist?, mock_exist) do
      assert_equal '.meta/solutions/alpha.rb', Exercise.new('alpha').example_file
    end
  end

  def test_legacy_example_file
    assert_equal 'example.rb', Exercise.new('').example_file
  end

  def test_testable_example_file
    exercise = Exercise.new('all-your-base')
    assert_equal 'all_your_base.rb', exercise.testable_example_file
  end

  def test_test_file
    exercise = Exercise.new('all-your-base')
    assert_equal 'all_your_base_test.rb', exercise.test_file
  end
end

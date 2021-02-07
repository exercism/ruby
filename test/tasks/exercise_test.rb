require_relative '../test_helper'
require 'generator/exercise'
require 'tmpdir'

class ExerciseTest < Minitest::Test
  def test_all
    Dir.mktmpdir('exercise-test') do |dir|
      FileUtils.mkdir_p "#{dir}/concept/test"
      FileUtils.mkdir_p "#{dir}/concept/test2"
      FileUtils.mkdir_p "#{dir}/practice/test3"
      FileUtils.mkdir_p "#{dir}/practice/test4"

      concept_file_list = FileList["#{dir}/concept/*"]
      practice_file_list = FileList["#{dir}/practice/*"]
      FileList.expects(:[]).with('exercises/concept/*').returns(concept_file_list).at_least_once
      FileList.expects(:[]).with('exercises/practice/*').returns(practice_file_list).at_least_once

      assert(Exercise.concept.all? { |e| e.instance_of?(Exercise) })
      assert(Exercise.practice.all? { |e| e.instance_of?(Exercise) })
      assert(Exercise.all.all? { |e| e.instance_of?(Exercise) })

      assert_equal %w[test test2], Exercise.concept.map(&:slug)
      assert_equal %w[test3 test4], Exercise.practice.map(&:slug)
      assert_equal %w[test test2 test3 test4], Exercise.all.map(&:slug)
    end
  end

  def test_slug
    exercise = Exercise.new('slug', :practice)
    assert_equal 'slug', exercise.slug
  end

  def test_to_s
    exercise = Exercise.new('slug', :practice)
    assert_equal 'slug', exercise.to_s
  end

  def test_concept_directory
    exercise = Exercise.new('slug', :concept)
    assert_equal 'exercises/concept/slug/.', exercise.directory
  end

  def test_practice_directory
    exercise = Exercise.new('slug', :practice)
    assert_equal 'exercises/practice/slug/.', exercise.directory
  end

  def test_example_file
    mock_exist = Minitest::Mock.new
    mock_exist.expect(:call, true, ['exercises/alpha/./.meta/solutions/alpha.rb'])
    File.stub(:exist?, mock_exist) do
      assert_equal '.meta/solutions/alpha.rb', Exercise.new('alpha', :practice).example_file
    end
  end

  def test_testable_example_file
    exercise = Exercise.new('all-your-base', :practice)
    assert_equal 'all_your_base.rb', exercise.testable_example_file
  end

  def test_test_file
    exercise = Exercise.new('all-your-base', :practice)
    assert_equal 'all_your_base_test.rb', exercise.test_file
  end
end

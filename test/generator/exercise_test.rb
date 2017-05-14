require_relative '../test_helper'

module Generator
  class ExerciseTest < Minitest::Test
    def test_slug
      exercise = Exercise.new(slug: 'alpha')
      assert_equal 'alpha', exercise.slug
    end

    def test_name
      exercise = Exercise.new(slug: 'alpha-beta')
      assert_equal 'alpha_beta', exercise.name
    end

    def test_case_class
      exercise = Exercise.new(slug: 'alpha-beta')
      assert_equal 'AlphaBetaCase', exercise.case_class
    end
  end
end

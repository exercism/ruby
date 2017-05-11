require_relative '../../test_helper.rb'

module Generator
  module Files
    class GeneratorCasesTest < Minitest::Test
      def test_available_returns_exercise_names
        track_path = 'test/fixtures/xruby'
        Dir.stub :glob, %w(/alpha_cases.rb hy_phen_ated_cases.rb) do
          assert_equal %w(alpha hy-phen-ated), GeneratorCases.available(track_path)
        end
      end

      def test_filename
        exercise_name = 'two-parter'
        assert_equal 'two_parter_cases', GeneratorCases.filename(exercise_name)
      end

      def test_class_name
        assert_equal 'TwoParterCase', GeneratorCases.class_name('two-parter')
      end

      def test_source_filename
        track_path = 'test/fixtures/xruby'
        exercise_name = 'foo'
        expected_filename = track_path + '/exercises/foo/.meta/generator/foo_cases.rb'
        File.stub(:exist?, true) do
          assert_equal(
            expected_filename,
            GeneratorCases.source_filename(track_path, exercise_name)
          )
        end
      end
    end
  end
end

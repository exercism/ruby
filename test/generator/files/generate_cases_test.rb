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

      def test_available_calls_glob_with_the_right_arguments
        track_path = '/track'
        expected_glob = "#{track_path}/exercises/*/.meta/generator/*_cases.rb"
        mock_glob_call = Minitest::Mock.new
        mock_glob_call.expect :call, [], [expected_glob, File::FNM_DOTMATCH]
        Dir.stub :glob, mock_glob_call do
          GeneratorCases.available(track_path)
        end
        mock_glob_call.verify
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

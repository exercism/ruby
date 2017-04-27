require_relative '../../test_helper.rb'

module Generator
  module Files
    class GeneratorCasesTest < Minitest::Test
      def test_no_cases_found
        track_path = 'test/fixtures/nonexistant'
        assert_equal [], GeneratorCases.available(track_path)
      end

      def test_cases_found
        track_path = 'test/fixtures/xruby'
        assert_equal %w(alpha beta), GeneratorCases.available(track_path).sort
      end

      def test_available_returns_exercise_names
        track_path = 'test/fixtures/xruby'
        Dir.stub :[], %w(/alpha_cases.rb hy_phen_ated_cases.rb) do
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
    end
  end
end

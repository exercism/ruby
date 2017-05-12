require_relative '../../test_helper.rb'

module Generator
  module Files
    class GeneratorCasesTest < Minitest::Test
      def test_available
        track_path = '/track'
        fake_filenames = %w(/track/zzz/alpha_case.rb /track/aaa/hy_phen_ated_case.rb)
        Dir.stub :glob, fake_filenames do
          assert_equal %w(alpha hy-phen-ated), GeneratorCases.available(track_path)
        end
      end

      def test_available_calls_glob_with_the_right_arguments
        track_path = '/track'
        expected_glob = "#{track_path}/exercises/*/.meta/generator/*_case.rb"
        mock_glob_call = Minitest::Mock.new
        mock_glob_call.expect :call, [], [expected_glob, File::FNM_DOTMATCH]
        Dir.stub :glob, mock_glob_call do
          GeneratorCases.available(track_path)
        end
        mock_glob_call.verify
      end

      def test_class_name
        assert_equal 'TwoParterCase', GeneratorCases.class_name('two-parter')
      end
    end
  end
end

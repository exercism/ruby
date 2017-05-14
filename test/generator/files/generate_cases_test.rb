require_relative '../../test_helper.rb'

module Generator
  module Files
    class GeneratorCasesTest < Minitest::Test
      def test_available
        track_path = '/track'
        fake_filepaths = %w(/track/exercises/alpha/zzz /track/exercises/hy-phen-ated/yyy)
        Dir.stub :glob, fake_filepaths do
          assert_equal %w(alpha hy-phen-ated), GeneratorCases.available(track_path)
        end
      end

      def test_available_calls_glob_with_the_right_arguments
        track_path = '/track'
        expected_glob = "#{track_path}/exercises/*/.meta/generator"
        mock_glob_call = Minitest::Mock.new
        mock_glob_call.expect :call, [], [expected_glob]
        Dir.stub :glob, mock_glob_call do
          GeneratorCases.available(track_path)
        end
        mock_glob_call.verify
      end
    end
  end
end

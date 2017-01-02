require_relative '../../test_helper.rb'
module Generator
  module Files
    class MetadataFilesTest < Minitest::Test
      FixturePaths = Paths.new(
        metadata: 'test/fixtures/metadata',
        track: 'test/fixtures/xruby'
      )

      class TestMetadataFiles
        def initialize
          @paths = FixturePaths
          @exercise_name = 'alpha'
        end
        attr_reader :paths, :exercise_name
        include MetadataFiles
      end

      def test_canonical_data
        subject = TestMetadataFiles.new
        assert_instance_of CanonicalDataFile, subject.canonical_data
      end
    end
  end
end

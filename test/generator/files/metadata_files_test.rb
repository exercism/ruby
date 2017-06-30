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
          @slug = 'alpha'
        end
        attr_reader :paths, :slug
        include MetadataFiles
      end

      def test_canonical_data
        subject = TestMetadataFiles.new
        assert_instance_of CanonicalDataFile, subject.canonical_data
      end
    end

    class CanonicalDataFileTest < Minitest::Test
      def test_version_for_file_that_does_not_exist
        subject = CanonicalDataFile.new(filename: 'nonexistant')
        assert_nil subject.version
      end

      def test_version
        subject = CanonicalDataFile.new(filename: 'has version key')
        Files.stub(:read, '{"version": "1.2.3"}' ) do
          assert_equal "1.2.3", subject.version
        end
      end

      def test_version_not_present
        subject = CanonicalDataFile.new(filename: 'no version key')
        Files.stub(:read, '{ "json": true }' ) do
          assert_nil subject.version
        end
      end
    end
  end
end

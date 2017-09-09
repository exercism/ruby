module Generator
  module Files
    module MetadataFiles
      def canonical_data
        CanonicalDataFile.new(
          filename: File.join(metadata_path, 'canonical-data.json'),
          docs: File.join(metadata_path, 'description.md'),
          repository_root: paths.metadata)
      end

      private

      def metadata_path
        File.join(paths.metadata, 'exercises', slug)
      end
    end

    class CanonicalDataFile < Readable
      def version
        JSON.parse(to_s)['version'] if to_s
      end
    end
  end
end

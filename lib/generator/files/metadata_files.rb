module Generator
  module Files
    module MetadataFiles
      include Exercise

      def canonical_data
        CanonicalDataFile.new(
          filename: File.join(exercise_metadata_path, 'canonical-data.json'),
          repository_root: paths.metadata)
      end

      private

      def exercise_metadata_path
        File.join(paths.metadata, 'exercises', exercise_name)
      end
    end

    class CanonicalDataFile < Readable
    end
  end
end

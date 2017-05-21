module Generator
  module Files
    module MetadataFiles
      def canonical_data
        CanonicalDataFile.new(
          filename: File.join(exercise_metadata_path, 'canonical-data.json'),
          repository_root: paths.metadata)
      end

      private

      def exercise_metadata_path
        File.join(paths.metadata, 'exercises', exercise.slug)
      end
    end

    class CanonicalDataFile < Readable
      def version
        JSON.parse(to_s)['version'] if to_s
      end
    end
  end
end

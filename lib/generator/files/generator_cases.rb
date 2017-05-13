module Generator
  module Files
    module GeneratorCases
      class << self
        def available(track_path)
          cases_filepaths(track_path).map { |filepath| slugify(filepath) }.sort
        end

        private

        def cases_filepaths(track_path)
          generator_glob = File.join(track_path, 'exercises', '*', '.meta', 'generator', '*_case.rb')
          Dir.glob(generator_glob, File::FNM_DOTMATCH)
        end

        def slugify(filepath)
          File.basename(filepath, '_case.rb').tr('_', '-')
        end
      end
    end
  end
end

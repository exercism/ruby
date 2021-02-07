module Generator
  module Files
    module GeneratorCases
      class << self
        def available(track_path)
          cases_filepaths(track_path).map { |filepath| slugify(filepath) }.sort
        end

        def source_filepath(track_path, slug)
          path = meta_generator_path(track_path, slug)
          filename = "#{filename(slug)}.rb"
          File.join(path, filename)
        end

        private
        def cases_filepaths(track_path)
          generator_glob = File.join(meta_generator_path(track_path, '*'), '*_case.rb')
          Dir.glob(generator_glob, File::FNM_DOTMATCH)
        end

        def slugify(filepath)
          File.basename(filepath, '_case.rb').tr('_', '-')
        end

        def filename(exercise_name_or_slug)
          "#{exercise_name_or_slug.tr('-', '_')}_case"
        end

        def meta_generator_path(track_path, slug)
          File.join(track_path, 'exercises', slug, '.meta', 'generator')
        end
      end
    end
  end
end

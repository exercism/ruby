module Generator
  module Files
    module GeneratorCases
      class << self
        def available(track_path)
          cases_filepaths(track_path).map { |filepath| slugify(filepath) }.sort
        end

        def class_name(exercise_name_or_slug)
          filename(exercise_name_or_slug).split('_').map(&:capitalize).join
        end

        private

        def cases_filepaths(track_path)
          generator_glob = File.join(track_path, 'exercises', '*', '.meta', 'generator', '*_case.rb')
          Dir.glob(generator_glob, File::FNM_DOTMATCH)
        end

        def slugify(filepath)
          %r{([^/]*)_case\.rb$}.match(filepath).captures[0].tr('_', '-')
        end

        def filename(exercise_name_or_slug)
          "#{exercise_name_or_slug.tr('-', '_')}_case"
        end
      end
    end
  end
end

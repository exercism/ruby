module Generator
  module Files
    module GeneratorCases
      class << self
        def available(track_path)
          filepaths(track_path).map do |filepath|
            %r{#{track_path}/exercises/([-a-z]+)/}.match(filepath)[1]
          end.sort
        end

        def source_filepath(track_path, slug)
          path = meta_generator_path(track_path, slug)
          filename = filename(slug) + '.rb'
          File.join(path, filename)
        end

        private

        def filepaths(track_path)
          Dir.glob(meta_generator_path(track_path, '*'))
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

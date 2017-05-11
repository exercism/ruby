module Generator
  module Files
    module GeneratorCases
      module_function

      def available(track_path)
        generator_glob = File.join(meta_generator_path(track_path, '*'), '*_cases.rb')
        Dir.glob(generator_glob, File::FNM_DOTMATCH).sort.map { |filename| exercise_name(filename) }
      end

      def filename(exercise_name)
        "#{exercise_name.tr('-', '_')}_cases"
      end

      def class_name(exercise_name)
        filename(exercise_name)[0..-2].split('_').map(&:capitalize).join
      end

      def exercise_name(filename)
        %r{([^/]*)_cases\.rb$}.match(filename).captures[0].tr('_', '-')
      end

      def source_filename(track_path, exercise_name)
        "%s.rb" % File.join(meta_generator_path(track_path, exercise_name), filename(exercise_name))
      end

      private
      module_function

      def meta_generator_path(track_path, exercise_name)
        File.join(track_path, 'exercises', exercise_name, '.meta', 'generator')
      end
    end
  end
end

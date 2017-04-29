module Generator
  module Files
    module GeneratorCases
      module_function

      def available(track_path)
        generator_glob = File.join(track_path, "{lib,exercises}", '**', '*_cases.rb')
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

      # temporary, when we've moved everything, move contents of cases_filename
      # to this method
      def load_filename(track_path, exercise_name)
        File.exist?(cases_filename(track_path, exercise_name)) ?
          cases_filename(track_path, exercise_name) :
          legacy_cases_filename(track_path, exercise_name)
      end

      # this becomes load_filename
      def cases_filename(track_path, exercise_name)
        "%s.rb" % File.join(track_path, 'exercises', exercise_name, '.meta', 'generator',
                            filename(exercise_name))
      end

      # this goes away
      def legacy_cases_filename(track_path, exercise_name)
        "%s.rb" % File.join(track_path, 'lib', filename(exercise_name))
      end
    end
  end
end

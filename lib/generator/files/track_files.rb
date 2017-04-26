require 'erb'

module Generator
  module Files
    module GeneratorCases
      module_function

      def available(track_path)
        generator_glob = File.join(track_path, 'lib', '*_cases.rb')
        Dir[generator_glob].sort.map { |filename| exercise_name(filename) }
      end

      def filename(exercise_name)
        "#{exercise_name.tr('-', '_')}_cases"
      end

      def class_name(exercise_name)
        filename(exercise_name)[0..-2].split('_').map(&:capitalize).join
      end

      def proc?(exercise_name)
        Object.const_defined?(proc_name(exercise_name))
      end

      def proc_name(exercise_name)
        class_name(exercise_name) + 's'
      end

      def exercise_name(filename)
        %r{([^/]*)_cases\.rb$}.match(filename).captures[0].tr('_', '-')
      end

      def load_filename(track_path, exercise_name)
        path = File.join(track_path, 'lib')
        "%s/%s.rb" % [ path, filename(exercise_name) ]
      end
    end

    module TrackFiles
      include Exercise

      def tests_version
        TestsVersionFile.new(filename: File.join(exercise_path, '.meta', '.version'))
      end

      def example_solution
        ExampleSolutionFile.new(filename: File.join(exercise_path, 'example.rb'))
      end

      def minitest_tests
        MinitestTestsFile.new(filename: File.join(exercise_path, minitest_tests_filename))
      end

      def tests_template
        TestsTemplateFile.new(filename: File.join(exercise_path, 'example.tt'))
      end

      private

      def exercise_path
        File.join(paths.track, 'exercises', exercise_name)
      end

      def minitest_tests_filename
        "#{exercise_name.gsub(/[ -]/, '_')}_test.rb"
      end
    end

    class TestsVersionFile < Writable
      def to_i
        to_s.to_i
      end

      def increment
        save(to_i + 1)
      end
    end

    class ExampleSolutionFile < Writable
      def update_version(version)
        content = to_s.gsub(/VERSION = \d+/, "VERSION = #{version}")
        save(content)
      end
    end

    class MinitestTestsFile < Writable
      def generate(template:, values:)
        content = ERB.new(template, nil, '<>').result values.get_binding
        save(content)
      end
    end

    class TestsTemplateFile < Readable
    end
  end
end

require 'erb'

module Generator
  module Files
    module TrackFiles
      def minitest_tests
        MinitestTestsFile.new(filename: File.join(exercise_path, minitest_tests_filename))
      end

      def tests_version
        TestsVersionFile.new(filename: File.join(meta_path, version_filename))
      end

      def example_solution
        ExampleSolutionFile.new(filename: File.join(solutions_path, example_filename))
      end

      def tests_template
        TestsTemplateFile.new(filename: tests_template_absolute_filename)
      end

      def test_case
        TestCaseFile.new(filename: File.join(generator_path, case_filename))
      end

      private

      def exercise_path
        File.join(paths.track, 'exercises', slug)
      end

      def meta_path
        File.join(exercise_path, '.meta')
      end

      def generator_path
        File.join(meta_path, 'generator')
      end

      def solutions_path
        File.join(meta_path, 'solutions')
      end

      def minitest_tests_filename
        "#{slug_underscored}_test.rb"
      end

      def version_filename
        '.version'
      end

      def example_filename
        "#{slug_underscored}.rb"
      end

      def tests_template_absolute_filename
        File.exist?(track_tests_template_filename) ? track_tests_template_filename :
          default_tests_template_filename
      end

      def track_tests_template_filename
        File.join(meta_path, 'generator', tests_template_filename)
      end

      def default_tests_template_filename
        File.join(paths.track, 'lib', 'generator', tests_template_filename)
      end

      def tests_template_filename
        'test_template.erb'
      end

      def case_filename
        "#{slug_underscored}_case.rb"
      end

      def slug_underscored
        slug.tr('-', '_')
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

    class TestCaseFile < Readable
    end
  end
end

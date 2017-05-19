require 'erb'

module Generator
  module Files
    module TrackFiles
      def minitest_tests(exercise)
        MinitestTestsFile.new(filename: File.join(exercise_path(exercise), minitest_tests_filename(exercise)))
      end

      def tests_version(exercise)
        TestsVersionFile.new(filename: File.join(meta_path(exercise), version_filename))
      end

      def example_solution(exercise)
        ExampleSolutionFile.new(filename: File.join(solutions_path(exercise), example_filename(exercise)))
      end

      def tests_template(exercise)
        TestsTemplateFile.new(filename: tests_template_absolute_filename(exercise))
      end

      def test_case(exercise)
        CaseFile.new(filename: File.join(generator_path(exercise), test_case_filename(exercise)))
      end

      private

      def exercise_path(exercise)
        File.join(paths.track, 'exercises', exercise.slug)
      end

      def meta_path(exercise)
        File.join(exercise_path(exercise), '.meta')
      end

      def solutions_path(exercise)
        File.join(meta_path(exercise), 'solutions')
      end

      def generator_path(exercise)
        File.join(meta_path(exercise), 'generator')
      end

      def minitest_tests_filename(exercise)
        "#{exercise.name}_test.rb"
      end

      def version_filename
        '.version'
      end

      def example_filename(exercise)
        "#{exercise.name}.rb"
      end

      def test_case_filename(exercise)
        "#{exercise.name}_case.rb"
      end

      def tests_template_absolute_filename(exercise)
        File.exist?(track_tests_template_filename(exercise)) ? track_tests_template_filename(exercise) :
          default_tests_template_filename
      end

      def track_tests_template_filename(exercise)
        File.join(meta_path(exercise), 'generator', tests_template_filename)
      end

      def default_tests_template_filename
        File.join(paths.track, 'lib', 'generator', tests_template_filename)
      end

      def tests_template_filename
        'test_template.erb'
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

    class CaseFile < Readable
    end
  end
end

require_relative '../../test_helper.rb'

module Generator
  module Files
    class GeneratorCasesTest < Minitest::Test
      def test_no_cases_found
        track_path = 'test/fixtures/nonexistant'
        assert_equal [], GeneratorCases.available(track_path)
      end

      def test_cases_found
        track_path = 'test/fixtures/xruby'
        assert_equal %w(alpha beta), GeneratorCases.available(track_path).sort
      end

      def test_available_returns_exercise_names
        track_path = 'test/fixtures/xruby'
        Dir.stub :[], %w(/alpha_cases.rb hy_phen_ated_cases.rb) do
          assert_equal %w(alpha hy-phen-ated), GeneratorCases.available(track_path)
        end
      end

      def test_filename
        exercise_name = 'two-parter'
        assert_equal 'two_parter_cases', GeneratorCases.filename(exercise_name)
      end

      def test_class_name
        assert_equal 'TwoParterCase', GeneratorCases.class_name('two-parter')
      end

      def test_proc_name
        exercise_name = 'two-parter'
        assert_equal 'TwoParterCases', GeneratorCases.proc_name(exercise_name)
      end
    end

    class TrackFilesTest < Minitest::Test
      FixturePaths = Paths.new(
        metadata: 'test/fixtures/metadata',
        track: 'test/fixtures/xruby'
      )

      class TestTrackFiles
        def initialize
          @paths = FixturePaths
          @exercise_name = 'alpha'
        end
        attr_reader :paths, :exercise_name
        include TrackFiles
      end

      def test_tests_version
        subject = TestTrackFiles.new
        assert_instance_of TestsVersionFile, subject.tests_version
      end

      def test_example_solution
        subject = TestTrackFiles.new
        assert_instance_of ExampleSolutionFile, subject.example_solution
      end

      def test_minitest_tests
        subject = TestTrackFiles.new
        assert_instance_of MinitestTestsFile, subject.minitest_tests
      end

      def test_tests_template
        subject = TestTrackFiles.new
        assert_instance_of TestsTemplateFile, subject.tests_template
      end
    end

    class TestsVersionFileTest < Minitest::Test
      class TestTestsVersionFile < TestsVersionFile
        def save(content)
          content
        end
      end

      def test_increment
        subject = TestTestsVersionFile.new(filename: 'test/fixtures/xruby/exercises/alpha/.meta/.version')
        assert_equal 2, subject.increment
      end
    end

    class ExampleSolutionFileTest < Minitest::Test
      class TestExampleSolutionFile < ExampleSolutionFile
        def save(content)
          content
        end
      end

      def test_update_version
        subject = TestExampleSolutionFile.new(filename: 'test/fixtures/xruby/exercises/alpha/example.rb')
        assert_match(/VERSION = 2/, subject.update_version(2))
      end
    end

    class MinitestTestsFileTest < Minitest::Test
      class TestMinitestTestsFile < MinitestTestsFile
        def save(content)
          content
        end
      end

      def test_update_version
        mock_template = Minitest::Mock.new
        mock_values = Minitest::Mock.new
        mock_values.expect :get_binding, 'mock binding'
        mock_erb = Minitest::Mock.new
        mock_erb.expect :result, 'new content', ['mock binding']

        subject = TestMinitestTestsFile.new(filename: 'test/fixtures/xruby/exercises/alpha/alpha_tests.rb')
        ERB.stub :new, mock_erb do
          assert_equal 'new content', subject.generate(template: mock_template, values: mock_values)
        end
      end
    end
  end
end

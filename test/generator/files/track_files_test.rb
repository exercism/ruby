require_relative '../../test_helper.rb'

module Generator
  module Files
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
        assert_equal(subject.send(:track_tests_template_filename),
                     subject.send(:tests_template_filename))
      end

      class TestTrackFilesUseDefault
        def initialize
          @paths = FixturePaths
          @exercise_name = 'notemplate'
        end
        attr_reader :paths, :exercise_name
        include TrackFiles
      end

      def test_default_tests_template
        subject = TestTrackFilesUseDefault.new
        assert_instance_of TestsTemplateFile, subject.tests_template
        assert_equal(subject.send(:default_tests_template_filename),
                     subject.send(:tests_template_filename))
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

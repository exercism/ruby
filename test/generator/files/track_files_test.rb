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
        end
        attr_reader :paths
        include TrackFiles
      end

      def test_tests_version
        subject = TestTrackFiles.new
        assert_instance_of TestsVersionFile, subject.tests_version(Exercise.new(slug: 'alpha-beta'))
      end

      def test_example_solution
        subject = TestTrackFiles.new
        expected_filename = FixturePaths.track + '/exercises/alpha-beta/.meta/solutions/alpha_beta.rb'
        assert_equal(
          expected_filename,
          subject.example_solution(Exercise.new(slug: 'alpha-beta')).filename
        )
      end

      def test_minitest_tests
        subject = TestTrackFiles.new
        assert_instance_of MinitestTestsFile, subject.minitest_tests(Exercise.new(slug: 'alpha-beta'))
      end

      def test_tests_template
        subject = TestTrackFiles.new
        expected_filename = FixturePaths.track + '/exercises/alpha-beta/.meta/generator/test_template.erb'
        assert_equal expected_filename, subject.tests_template(Exercise.new(slug: 'alpha-beta')).filename
      end

      class TestTrackFilesUseDefault
        def initialize
          @paths = FixturePaths
        end
        attr_reader :paths
        include TrackFiles
      end

      def test_default_tests_template
        subject = TestTrackFilesUseDefault.new
        expected_filename = FixturePaths.track + '/lib/generator/test_template.erb'
        assert_equal expected_filename, subject.tests_template(Exercise.new(slug: 'notemplate')).filename
      end

      def test_test_case
        subject = TestTrackFiles.new
        expected_test_case_filename =
          FixturePaths.track + '/exercises/alpha-beta/.meta/generator/alpha_beta_case.rb'
        assert_equal expected_test_case_filename, subject.test_case(Exercise.new(slug: 'alpha-beta')).filename
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
        subject = TestExampleSolutionFile.new(
          filename: 'test/fixtures/xruby/exercises/alpha/.meta/solutions/alpha.rb'
        )
        assert_match(/VERSION = 2/, subject.update_version(2))
      end
    end

    class MinitestTestsFileTest < Minitest::Test
      class TestMinitestTestsFile < MinitestTestsFile
        def save(content)
          content
        end
      end

      def test_generate
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

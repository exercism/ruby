require_relative '../test_helper'

module Generator
  class RepositoryTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_version
      subject = Repository.new(paths: FixturePaths, exercise_name: 'alpha')
      assert_equal 1, subject.version
    end

    def test_exercise_name
      subject = Repository.new(paths: FixturePaths, exercise_name: 'alpha')
      assert_equal 'alpha', subject.exercise_name
    end

    def test_update_tests_version
      mock_tests_version = Minitest::Mock.new.expect :increment, 2
      subject = Repository.new(paths: FixturePaths, exercise_name: 'alpha')
      subject.define_singleton_method(:tests_version) { mock_tests_version }
      assert_equal 2, subject.update_tests_version
      mock_tests_version.verify
    end

    def test_update_example_solution
      mock_example_solution = Minitest::Mock.new.expect :update_version, nil, [1]
      subject = Repository.new(paths: FixturePaths, exercise_name: 'alpha')
      subject.define_singleton_method(:example_solution) { mock_example_solution }
      subject.update_example_solution
      mock_example_solution.verify
    end

    def test_create_tests_file
      mock_tests_template = Minitest::Mock.new.expect :to_s, 'template'
      mock_template_values = Minitest::Mock.new
      mock_minitest_tests = Minitest::Mock.new.expect :generate, nil, [{ template: 'template', values: mock_template_values }]
      subject = Repository.new(paths: FixturePaths, exercise_name: 'alpha')
      subject.define_singleton_method(:minitest_tests) { mock_minitest_tests }
      subject.define_singleton_method(:tests_template) { mock_tests_template }
      subject.define_singleton_method(:template_values) { mock_template_values }
      subject.create_tests_file
      mock_minitest_tests.verify
    end
  end

  class LoggingRepositoryTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_update_tests_version
      fake_version = 2

      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ["Incremented tests version to #{fake_version}"]

      mock_tests_version = Minitest::Mock.new.expect :increment, fake_version
      subject = LoggingRepository.new(paths: FixturePaths, exercise_name: 'alpha', logger: mock_logger)
      subject.define_singleton_method(:tests_version) { mock_tests_version }
      subject.define_singleton_method(:version) { fake_version }
      subject.update_tests_version
      mock_logger.verify
    end

    def test_update_example_solution
      fake_version = 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ["Updated version in example solution to #{fake_version}"]

      mock_example_solution = Minitest::Mock.new.expect :update_version, nil, [2]
      subject = LoggingRepository.new(paths: FixturePaths, exercise_name: 'alpha', logger: mock_logger)
      subject.define_singleton_method(:example_solution) { mock_example_solution }
      subject.define_singleton_method(:version) { fake_version }

      subject.update_example_solution
      mock_logger.verify
    end

    # Too much to set up here :(
    def test_create_tests_file
      mock_logger = Minitest::Mock.new.expect :info, nil, ['Generated tests for alpha']

      mock_tests_template = Minitest::Mock.new.expect :to_s, 'template'
      mock_template_values = Minitest::Mock.new
      mock_minitest_tests = Minitest::Mock.new.expect :generate, nil, [{ template: 'template', values: mock_template_values }]
      subject = LoggingRepository.new(paths: FixturePaths, exercise_name: 'alpha', logger: mock_logger)
      subject.define_singleton_method(:minitest_tests) { mock_minitest_tests }
      subject.define_singleton_method(:tests_template) { mock_tests_template }
      subject.define_singleton_method(:template_values) { mock_template_values }
      subject.create_tests_file
      mock_logger.verify
    end
  end
end

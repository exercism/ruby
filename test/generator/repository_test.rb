require_relative '../test_helper'

module Generator
  class RepositoryTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_version
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 1, subject.version
    end

    def test_slug
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 'alpha', subject.slug
    end

    def test_update_tests_version
      mock_tests_version = Minitest::Mock.new.expect :increment, 2
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject.define_singleton_method(:tests_version) { mock_tests_version }
      assert_equal 2, subject.update_tests_version
      mock_tests_version.verify
    end

    def test_update_example_solution
      mock_example_solution = Minitest::Mock.new.expect :update_version, nil, [1]
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject.define_singleton_method(:example_solution) { mock_example_solution }
      subject.update_example_solution
      mock_example_solution.verify
    end

    def test_create_tests_file
      mock_tests_template = Minitest::Mock.new.expect :to_s, 'template'
      mock_template_values = Minitest::Mock.new
      mock_minitest_tests = Minitest::Mock.new.expect :generate, nil, [{ template: 'template', values: mock_template_values }]
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      subject.define_singleton_method(:minitest_tests) { mock_minitest_tests }
      subject.define_singleton_method(:tests_template) { mock_tests_template }
      subject.define_singleton_method(:template_values) { mock_template_values }
      subject.create_tests_file
      mock_minitest_tests.verify
    end
  end

  class LoggingRepositoryTest < Minitest::Test
    def test_create_tests_file
      mock_repository = Minitest::Mock.new
      mock_repository.expect :create_tests_file, nil
      mock_repository.expect :slug, 'alpha'
      mock_repository.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :info, nil, ['Generated alpha tests version 2']

      subject = LoggingRepository.new(repository: mock_repository, logger: mock_logger)
      subject.create_tests_file

      mock_repository.verify
    end

    def test_update_tests_version
      mock_repository = Minitest::Mock.new
      mock_repository.expect :update_tests_version, nil
      mock_repository.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Incremented tests version to 2']

      subject = LoggingRepository.new(repository: mock_repository, logger: mock_logger)
      subject.update_tests_version

      mock_repository.verify
    end

    def test_update_example_solution
      mock_repository = Minitest::Mock.new
      mock_repository.expect :update_example_solution, nil
      mock_repository.expect :version, 2
      mock_logger = Minitest::Mock.new
      mock_logger.expect :debug, nil, ['Updated version in example solution to 2']

      subject = LoggingRepository.new(repository: mock_repository, logger: mock_logger)
      subject.update_example_solution

      mock_repository.verify
    end
  end
end

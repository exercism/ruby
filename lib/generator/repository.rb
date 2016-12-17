require 'delegate'

module Generator
  class Repository
    include Files::TrackFiles
    include Files::MetadataFiles
    include TemplateValuesFactory

    def initialize(paths:, exercise_name:)
      @paths = paths
      @exercise_name = exercise_name
    end

    attr_reader :paths, :exercise_name

    def version
      tests_version.to_i
    end

    def update_tests_version
      tests_version.increment
    end

    def update_example_solution
      example_solution.update_version(version)
    end

    def create_tests_file
      minitest_tests.generate(
        template: tests_template.to_s,
        values: template_values
      )
    end
  end

  # A repository that also logs its progress.
  class LoggingRepository < Repository
    def initialize(paths:, exercise_name:, logger:)
      super(paths: paths, exercise_name: exercise_name)
      @logger = logger
    end

    def update_tests_version
      super
      @logger.info "Incremented tests version to #{version}"
    end

    def update_example_solution
      super
      @logger.info "Updated version in example solution to #{version}"
    end

    def create_tests_file
      super
      @logger.info "Generated tests for #{exercise_name}"
    end
  end

  # This exists to give us a clue as to what we are delegating to.
  class RepositoryDelegator < SimpleDelegator
  end
end

require 'delegate'

module Generator
  class Repository
    include Files::TrackFiles
    include Files::DefaultFiles
    include Files::TestsFileFactory
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

  end

  # This exists to give us a clue as to what we are delegating to.
  class RepositoryDelegator < SimpleDelegator
  end

  # A repository that also logs its progress.
  class LoggingRepository < RepositoryDelegator
    def initialize(repository:, logger:)
      __setobj__ @repository = repository
      @logger = logger
    end

    def update_tests_version
      @repository.update_tests_version
      @logger.debug "Incremented tests version to #{version}"
    end

    def update_example_solution
      @repository.update_example_solution
      @logger.debug "Updated version in example solution to #{version}"
    end

    def create_tests_file
      @repository.create_tests_file
      @logger.info "Generated #{exercise_name} tests version #{version}"
    end
  end
end

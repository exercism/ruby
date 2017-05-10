require 'require_all'
require_rel 'generator' # Include everything in the 'generator' subdirectory

module Generator
  # Immutable value object for storing paths
  class Paths
    attr_reader :track, :metadata
    def initialize(track:, metadata:)
      @track = track
      @metadata = metadata
    end
  end

  # A generator has to have a #call method, that's the only requirement.
  # It doesn't have to be a RepositoryDelegator
  class GenerateAllTests
    def initialize(paths:, verbose:)
      @paths = paths
      @verbose = verbose
    end

    def call
      Files::GeneratorCases.available(@paths.track).map do |exercise_name|
        GeneratorFactory.new(
          exercise_name: exercise_name,
          paths: @paths,
          verbose: @verbose,
          freeze: true
        ).build.call
      end
    end
  end

  # This contains the order for updating/generating the files. (Strategy pattern).
  # Doesn't update the version information.
  class GenerateTests < RepositoryDelegator
    def call
      create_tests_file
    end
  end

  # Update everything.
  class UpdateVersionAndGenerateTests < RepositoryDelegator
    def call
      update_tests_version
      update_example_solution
      create_tests_file
    end
  end
end

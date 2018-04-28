require 'generator/implementation'

module Generator
  # Immutable value object for storing paths
  class Paths
    attr_reader :track, :metadata
    def initialize(track:, metadata:)
      @track = track
      @metadata = metadata
    end
  end

  # This contains the order for updating/generating the files. (Strategy pattern).
  # Doesn't update the version information.
  class GenerateTests < ImplementationDelegator
    def call
      build_tests
    end
  end

  # Update everything.
  class UpdateVersionAndGenerateTests < ImplementationDelegator
    def call
      update_tests_version
      update_example_solution
      build_tests
    end
  end
end

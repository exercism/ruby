require 'require_all'
require_rel 'generator' # Include everything in the 'generator' subdirectory

module Generator
  # Immutable value object for storing paths
  class Paths
    attr_reader :track, :docs, :metadata
    def initialize(track:, docs:, metadata:)
      @track = track
      @docs = docs
      @metadata = metadata
    end
  end

  # This contains the order for updating/generating the files. (Strategy pattern).
  # Doesn't update the version information.
  class GenerateTests < ImplementationDelegator
    def call
      build_tests
      build_readme
    end
  end

  # Update everything.
  class UpdateVersionAndGenerateTests < ImplementationDelegator
    def call
      update_tests_version
      update_example_solution
      build_tests
      build_readme
    end
  end
end

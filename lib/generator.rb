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

  # This contains the order for updating/generating the files. (Strategy pattern).
  # Doesn't update the version information.
  class GenerateTests < ExerciseDelegator
    def call
      create_tests_file
    end
  end

  # Update everything.
  class UpdateVersionAndGenerateTests < ExerciseDelegator
    def call
      update_tests_version
      update_example_solution
      create_tests_file
    end
  end
end

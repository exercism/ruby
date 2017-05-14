require 'delegate'

module Generator
  class Repository
    include Files::TrackFiles
    include Files::MetadataFiles

    def initialize(paths:, exercise:)
      @paths = paths
      @exercise = exercise
    end
    attr_reader :paths, :exercise
  end
end

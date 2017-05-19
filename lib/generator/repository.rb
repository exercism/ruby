module Generator
  class Repository
    include Files::TrackFiles
    include Files::MetadataFiles

    def initialize(paths:)
      @paths = paths
    end
    attr_reader :paths
  end
end

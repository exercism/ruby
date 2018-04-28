require 'generator/files/metadata_files'
require 'generator/files/track_files'

module Generator
  class Repository
    include Files::TrackFiles
    include Files::MetadataFiles

    attr_reader :paths, :slug
    def initialize(paths:, slug:)
      @paths = paths
      @slug = slug
    end
  end
end

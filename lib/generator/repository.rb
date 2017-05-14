module Generator
  class Repository
    include Files::TrackFiles
    include Files::MetadataFiles

    def initialize(paths:, slug:)
      @paths = paths
      @slug = slug
    end
    attr_reader :paths, :slug

    def name
      @name ||= slug.tr('-', '_')
    end

    def cases_load_name
      Files::GeneratorCases.source_filepath(paths.track, slug)
    end
  end
end

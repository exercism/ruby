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

    # these two should get refactored somewhere together later
    def case_class_name
      Files::GeneratorCases.class_name(slug)
    end

    def case_load_name
      Files::GeneratorCases.source_filepath(paths.track, slug)
    end
  end
end

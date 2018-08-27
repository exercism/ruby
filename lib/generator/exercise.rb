module Generator
  class Exercise
    attr_reader :slug

    def initialize(slug:)
      @slug = slug
    end

    def name
      slug.tr('-', '_')
    end

    def case_class
      slug.split('-').map(&:capitalize).join + 'Case'
    end
  end
end

module Generator
  class Exercise
    using Generator::Underscore

    attr_reader :slug

    def initialize(slug:)
      @slug = slug
    end

    def name
      @name ||= slug.underscore
    end

    def directory
      "exercises/#{@slug}"
    end

    def case_class
      slug.camel_case + 'Case'
    end
  end
end
